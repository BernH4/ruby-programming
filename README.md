# ruby-programming

A repository for projects made using Ruby, following [The Odin's Project Ruby's Programming Course](https://www.theodinproject.com/courses/ruby-programming).

## 1. Anagrams

Based on exercise 8 from [LaunchSchool's Hashes Chapter](https://launchschool.com/books/ruby/read/hashes).

Challenge: Given the array...

```ruby
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live','fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide','flow', 'neon']
```

Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

```ruby
["demo", "dome", "mode"]
["neon", "none"]
(etc)
```

## 2. Caesar Cipher

From [Project: Caesar Cipher](https://www.theodinproject.com/courses/ruby-programming/lessons/caesar-cipher).

Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:

```ruby
  > caesar_cipher("What a string!", 5)
  => "Bmfy f xywnsl!"
```

## 3. Sub Strings

From [Project: Sub Strings](https://www.theodinproject.com/courses/ruby-programming/lessons/sub-strings?ref=lnav)

Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

```ruby
  > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  > substrings("below", dictionary)
  => { "below" => 1, "low" => 1 }
```

Next, make sure your method can handle multiple words:

```ruby
  > substrings("Howdy partner, sit down! How's it going?", dictionary)
  => { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }
```


