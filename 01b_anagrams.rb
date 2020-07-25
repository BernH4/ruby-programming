words =  [
  'demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live','fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide','flow', 'neon'
]

anagrams = {}

# Loop word through words
  # Get each key from splitting, sorting, and joining them 

  # If key exists, push
  # Else, assign array filled with word to key

words.each do |word|
  key = word.split('').sort.join.to_sym

  if (anagrams[key])
    anagrams[key].push(word)
  else
    anagrams[key] = [word]
  end
end

pp anagrams