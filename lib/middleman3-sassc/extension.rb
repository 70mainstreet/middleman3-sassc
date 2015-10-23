module Middleman3
  module SassC
    class Extension < Middleman::Extension
      def initialize(*)
        super
        require 'middleman3-sassc/monkey-patches'
      end
    end
  end
end
