words =  [
  'demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live','fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide','flow', 'neon'
]

anagrams = {}

def check_anagram(word1, word2)

  for i in 0..word1.length-1
    same = false
    temp = ''

    for j in 0..word2.length-1

      if word1[i] == word2[j]
        same = true
      else
        temp = temp + word2[j].to_s
      end
    end

    word2 = temp
  end

  return word2.length == 0 ? true : false
end


anagrams = {}

anagrams[words[0].to_sym] = [words[0]]

count = 0

for i in 0..words.length-1
  is_anagram = false

  anagrams.each do |k, v|
    if check_anagram(k.to_s, words[i]) && k.to_s != words[i]
      is_anagram = true

      if (anagrams[k].include? words[i]) == false
        anagrams[k].push(words[i])
      end
    end
  end

  if !is_anagram
    anagrams[words[i].to_sym] = [words[i]]
  end
end

anagrams.each do |k, v|
  pp v
end
