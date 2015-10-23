require 'sassc'
require 'sassc-rails'

module Middleman3
  module SassC
    def self.create_sassc_options(environment, context)
      {
        load_paths: environment.paths,
        importer: ::SassC::Rails::Importer,
        sprockets: {
          context: context,
          environment: environment
        }
      }
    end
  end
end

# Monkey patch Sprockets to use SassC
module Sprockets::Sass
  class SassTemplate
    def evaluate(context, locals, &block)
      # empty file?
      if data.empty?
        @output = ''
      end

      @output ||= begin
        @context = context
        options = sass_options
        options = options.merge(::Middleman3::SassC::create_sassc_options(context.environment,
          context))
        ::SassC::Engine.new(data, options).render
      end
    end
  end
end

module Middleman::Renderers::Sass
  class SassPlusCSSFilenameTemplate
    def evaluate(context, _)
      # empty file?
      if data.empty?
        @output = ''
      end

      @context ||= context
      sprockets = context.sprockets
      @sprockets_context ||= sprockets.context_class.new(sprockets, File.basename(file),
        Pathname.new(file))

      options = sass_options.merge(::Middleman3::SassC::create_sassc_options(sprockets,
        @sprockets_context))
      @engine = ::SassC::Engine.new(data, options)
      @engine.render
    end
  end
end
