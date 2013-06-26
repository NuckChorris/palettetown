module PaletteTown
  class Scheme
    class << self
      def name name=nil
        if name.nil?
          @name
        else
          @name = name
        end
      end
      def author author=nil
        if author.nil?
          @author
        else
          @author = author
        end
      end
      def description description=nil
        if description.nil?
          @description
        else
          @description = description
        end
      end
      def lighter color, amount
        color = PaletteTown::Color.new color unless color.is_a? PaletteTown::Color
        color.lum += amount / 100.0
        color
      end
      def darker color, amount
        color = PaletteTown::Color.new color unless color.is_a? PaletteTown::Color
        color.lum -= amount / 100.0
        color
      end
      def saturate color, amount
        color = PaletteTown::Color.new color unless color.is_a? PaletteTown::Color
        color.sat += amount / 100.0
        color
      end
      def desaturate color, amount
        color = PaletteTown::Color.new color unless color.is_a? PaletteTown::Color
        color.sat -= amount / 100.0
      end
      def spin color, amount
        color = PaletteTown::Color.new color unless color.is_a? PaletteTown::Color
        color.hue += amount / 360.0
        color
      end
      def hi rule, *options
        @rules ||= {}
        @rules[rule] = PaletteTown::Rule.new(*options)
      end
      def to_s
        out = <<-EOF
" Vim color file
"   Generated by PaletteTown
"   http://nuckchorris.github.io/palettetown/
"
" Name: #{name}
" Author: #{author}
" Notes: #{description}

hi clear
if version > 580
  if exists("syntax_on")
    syntax reset
  endif
endif

let colors_name="#{name}"

EOF
        if @rules[:Normal]
          out << <<-EOF
if has("gui_running")
  set background=#{if @rules[:Normal][:guibg].lum < 0.5 then "dark" else "light" end}
endif

EOF
          @rules[:Normal][:guibg].lum < 0.5
        else
          warn "No Normal hilight found; can't guess background"
        end
        @rules.each do |rule, opts|
          out << "hi #{rule}"
          opts.each do |key, val|
            out << " #{key}=#{val}" unless val.nil?
          end
          out << "\n"
        end
        out
      end
    end
  end
end
