require 'thor'

module PaletteTown
  class CLI < Thor
    desc "build FILE", "build the PaletteTown in FILE into a beautiful butterfly"
    option :out, :aliases => [:o], :desc => "Where to output the results. defaults to stdout"
    def build file
      path = File.expand_path file
      if File.exist? path
        temp = Class.new PaletteTown::Scheme
        temp.instance_eval(IO.read(path))
        if options[:out]
          File.open(File.expand_path(options[:out]), 'w') do |f|
            f.write(temp.to_s)
          end
        else
          puts temp.to_s
        end
      end
    end
  end
end
