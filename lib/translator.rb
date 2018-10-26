require 'yaml'
file_path = './lib/emoticons.yml'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  translator = { "get_emoticon" => {}, "get_meaning" => {} }
  emoticons.each do |descriptors, emojis|
        translator["get_emoticon"][emojis[0]] = emojis[-1]
        translator["get_meaning"][emojis[-1]] = descriptors
  end
  translator
end

def get_japanese_emoticon(file_path, emojis)
  translator = load_library(file_path)
  english_to_japanese = translator["get_emoticon"][emojis]
    if english_to_japanese == nil
      return "Sorry, that emoticon was not found"
    else english_to_japanese
  end
end

def get_english_meaning(file_path, emojis)
  translator = load_library(file_path)
  japanese_to_english = translator["get_meaning"][emojis]
    if japanese_to_english == nil
      return "Sorry, that emoticon was not found"
    else japanese_to_english
  end
end
