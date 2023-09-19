RuboCop::AST::ProcessedSource.prepend(
  Module.new do
    def parser_class(ruby_version)
      p [ruby_version, Parser::YARP::VERSION_3_3, ruby_version == Parser::YARP::VERSION_3_3]
      super
    end
  end
)
