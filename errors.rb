module SMSAdminErrors
  class InvalidServiceId < StandardError; end

  class UnknownService < StandardError; end

  class MissingParameters < StandardError
    attr_accessor :missing_parameters

    def initialize(missing_parameters)
      @missing_parameters = missing_parameters
    end
  end
end