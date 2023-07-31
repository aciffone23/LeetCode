def h_index(citations)
    order = citations.sort.reverse
    h_index = 0 
    order.each_with_index do |ele, i|
      if ele >= i + 1 
        h_index = i + 1
      end
    end
    return h_index
end

def remove_element(nums, val)

    nums.each do |ele|
        if ele == val 
            nums.delete(ele)
        end
    end
    k = nums.length 
    
    return k
end

def remove_duplicates(nums)
  newArr = []

  nums.each do |ele|
      if !newArr.include?(ele)
          newArr << ele
      end
  end
  nums.clear.concat(newArr)
  k = newArr.length
  return k
  
end

def majority_element(nums)
  newHash = Hash.new(0)
  nums.each do |num| 
      newHash[num] += 1
  end

  grabele = newHash.select {|k,v| v >= nums.length/2.0}
  grabele.keys.first
end

def roman_to_int(s)
  romans = {
      "I" => 1,
      "V" => 5,
      "X" => 10,
      "L" => 50,
      "C" => 100, 
      "D" => 500, 
      "M" => 1000
  }

  number = 0

  s.each_char.with_index do |char,i|
      if char == 'I' && (s[i + 1] == 'V' || s[i + 1] == 'X')
          number -= 1
      elsif char == 'X' && (s[i + 1] == 'L' || s[i + 1] == 'C')
          number -= 10
      elsif char == 'C' && (s[i + 1] == 'D' || s[i + 1] == 'M')
          number -= 100
      else
          number += romans[char]
      end
  end
  return number
end

def length_of_last_word(s)
  s.split(" ").last.length  
end

def longest_common_prefix(strs)
    newStr = ""
    strs[0].each_char.with_index do |char,i|
        strs.each do |s|
            if s[i] != char 
                return newStr
            end
        end
        newStr += char
    end
    return newStr
end

def str_str(haystack, needle)
  if !haystack.include?(needle)
      return -1  
  else
      return haystack.index(needle)
  end   
end

def can_construct(ransom_note, magazine)
  if magazine.length < ransom_note.length 
      return false
  end
  noteHash = Hash.new(0)

  ransom_note.each_char do |char|
      noteHash[char] += 1
  end

  magazine.each_char do |char|
      if noteHash.include?(char)
          noteHash[char] -= 1
      end
  end
  noteHash.each do |k,v|
      if v > 0
          return false
      end
  end
  return true
end


def is_isomorphic(s, t)
  sHash = {}
  tHash = {}
  i = 0 
  while i < s.length 
      if (sHash.has_key?(s[i]) && sHash[s[i]] != t[i]) ||
          (tHash.has_key?(t[i]) && tHash[t[i]] != s[i])
          return false
      end
      sHash[s[i]] = t[i]
      tHash[t[i]] = s[i]
      i += 1
  end
  return true 
end

def word_pattern(pattern, s)
  newHash = {}
  words = s.split(" ")
  used = Set.new

  if pattern.split("").length != words.length
      return false
  end

  pattern.each_char.with_index do |char, i|
      if newHash.has_key?(char) && newHash[char] != words[i]
          return false
      else
          if used.include?(words[i]) && newHash[char] != words[i]
              return false
          end
          newHash[char] = words[i]
          used << words[i]
      end
  end
  return true
end

def is_anagram(s, t)
  sHash = Hash.new(0)
  tHash = Hash.new(0)

  if s.length != t.length
      return false
  end

  s.each_char do |char|
      sHash[char] += 1
  end

  t.each_char do |char|
      tHash[char] += 1
  end

  if sHash != tHash
      return false
  end
  return true

end

def is_palindrome(x)
  toS = x.to_s
  if toS == toS.reverse 
      return true
  end
  return false
end

def plus_one(digits)
  # if digits[-1] == 9
  #     int = digits.join("").to_i
  #     digits = (int + 1).digits.reverse
  # else
  #     digits[-1] = digits[-1] + 1
  # end
  # return digits
  (digits.join.to_i + 1).digits.reverse
end

def max_profit(prices)
  maxProfit = 0 
  i = 0
  while i < prices.length - 1
      if prices[i] > prices[i + 1]
          i += 1
      else 
          profit = prices[i + 1] - prices[i]
          j = i
          until profit < 0 || j == prices.length - 1
              j += 1
              profit = prices[j] - prices[i]
              maxProfit = [maxProfit, profit].max
          end
          i = j
      end
  end
  return maxProfit
end

# two pointer solution instead 
def is_palindrome(s)
  # alphabet = "abcdefghijklmnopqrstuvwxyz"
  # newStr = ""
  # s.each_char do |char|
  #     if alphabet.include?(char.downcase) || char.to_i.to_s == char
  #         newStr += char.downcase
  #     end
  # end
  # newStr == newStr.reverse 

  characters = s.downcase.chars.filter{ |char| ("a".."z").include?(char) || ("0".."9").include?(char)}
  right = 0
  left = characters.length - 1
  while right <= left do
    if characters[right] == characters[left]
         right += 1
         left -= 1
     else
         return false
    end
  end
  true
end

def max_profit(prices)
  totalProfit = 0 
  i = 0 
  curProfit = 0
  while i <= prices.length - 2
      if prices[i] > prices[i + 1]
          i += 1
      else
          curProfit = prices[i + 1] - prices[i]
          i += 1
      end
      totalProfit += curProfit
      curProfit = 0 
  end
  return totalProfit
end

def reverse_words(s)
  newStr = ''
  words = s.split(" ")
  (words.length - 1).downto(0) do |i|
      if i == 0
          newStr += words[i]
      else 
          newStr += words[i] + ' '
      end
  end
  return newStr
end

def is_subsequence(s, t)
  t.each_char do |char|
      if char == s[0]
          s.slice!(0)
      end
  end
  s.empty?
end

def is_happy(n)
  if n == 1
      return true
  end

  if n < 9 && n != 7
      return false
  end

  newNum = n.digits.sum { |digit| digit * digit}

  is_happy(newNum)
  
end

def my_sqrt(x)
  (x ** 0.5).to_i
end

def longest_consecutive(nums)
  longestSeq = 0
  currentSeq = 1
  i = 0
  nums = nums.uniq.sort!
  if nums.empty?
      return 0
  end
  while i < nums.length - 1
      if longestSeq > 0 && nums[i] + longestSeq == nums[longestSeq]
          currentSeq = (longestSeq * 2) - 1
          longestSet = currentSeq
          i = currentSeq
      elsif nums[i] + 1 == nums[i + 1]
          currentSeq += 1
          i += 1
      else
          longestSeq = [longestSeq, currentSeq].max
          currentSeq = 1
          i += 1
      end
  end
  return longestSeq = [longestSeq,currentSeq].max
end

def is_valid(s)
  stack = []
  hash = { ')' => '(', ']' => '[', '}' => '{'}

  s.each_char do |char|
      if !hash[char]
          stack << char
      elsif hash[char] == stack[-1]
          stack.pop
      else 
          return false
      end
  end
  stack.empty?
end