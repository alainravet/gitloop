
# turn the feature multiline "enhanced" text into a regexp

def make_smart_regexp(raw_expected_output)
  Regexp.compile escape_xxl(raw_expected_output),
                 Regexp::MULTILINE
end


# turn the feature multiline "enhanced" text into a valid regexp-ready string.
# It
#  - escapes the string
#  - translate <a_sha> -> (\S+)
#  - replace \n by \s+ because of a problem with multiline strings in Cucumber

def escape_xxl(raw_text)
  Regexp.escape(raw_text).tap do |text|
    text.gsub!('\n', "\\s*")  # necessary (? due to Cucumber ??)
    text.gsub!(/<a_sha>/, '(\S+)')
  end
end


