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

def merge(nums1, m, nums2, n)
  n.times do 
      nums1.pop
  end
  n.times do 
      ele = nums2.pop
      nums1.push(ele)
  end
  nums1.sort!
end

def can_jump(nums)
  #greedy solution
  goal = nums.length - 1

  (nums.length - 1).downto(0) do |i|
    if i + nums[i] >= goal 
      goal = i
    end
  end

  return goal == 0
end

class RandomizedSet
  def initialize()
      @set = {}

  end


=begin
  :type val: Integer
  :rtype: Boolean
=end
  def insert(val)
      if !@set[val]
          @set[val] = true
          return true
      end
      return false
  end


=begin
  :type val: Integer
  :rtype: Boolean
=end
  def remove(val)
      if @set.delete(val)
          return true
      end
      return false
  end


=begin
  :rtype: Integer
=end
  def get_random()
      @set.keys.sample
  end
end

def can_complete_circuit(gas, cost)
  if gas.sum < cost.sum
      return -1
  end
  total = 0
  # start = 0 
  gas.each_with_index do |g, i|
      total += (g - cost[i])

      if total < 0 
          total = 0
          start = i + 1
      end
      
  end
  return start
end

def int_to_roman(num)
  romans = [
      ["I", 1,],
      ["IV" , 4],
      ["V" , 5],
      ["IX" , 9],
      ["X" , 10],
      ["XL" , 40],
      ["L" , 50],
      ["XC" , 90],
      ["C" , 100],
      ["CD" , 400],
      ["D" , 500], 
      ["CM" , 900],
      ["M" , 1000],
  ]

  str = ""

  romans.reverse.each do |arr|
      while num >= arr[-1]
          str += arr[0]
          num -= arr[-1]
      end
  end

  return str
end

def two_sum(numbers, target)
  i = 0 
  j = numbers.length - 1

  while i < numbers.length 
      if numbers[i] + numbers[j] == target
          return i + 1,j + 1
      elsif numbers[i] + numbers[j] > target
          j -= 1
      else
          i += 1
      end
  end
end

def max_area(height)
  i = 0
  j = height.length - 1
  maxArea = 0
  while i != j
      distance = ([height[i], height[j]].min * (j - i))
      if distance > maxArea
          maxArea = distance
      end
      if height[i] > height[j]
          j -= 1
      else
          i += 1
      end
  end
  return maxArea
end

def three_sum(nums)
  i = 0
  nums.sort!
  newArr = []
  
  while i < nums.length - 2
      j = i + 1
      k = nums.length - 1
      
      while j < k
          sum = nums[i] + nums[j] + nums[k]
          
          if sum == 0
              newArr << [nums[i], nums[j], nums[k]]
              j += 1
              j += 1 while j < k && nums[j] == nums[j - 1]
              k -= 1 while j < k && nums[k] == nums[k + 1]
          elsif sum < 0
              j += 1
          else
              k -= 1
          end
      end
      
      i += 1
      i += 1 while i < nums.length - 2 && nums[i] == nums[i - 1]
  end
  
  return newArr
end

def min_sub_array_len(target, nums)
  if nums.sum < target
      return 0
  end
  minCount = nums.length + 1
  left = 0 
  right = 0
  currentSum = 0 
  while left <= right && right < nums.length 
      currentSum += nums[right]
      while currentSum >= target
          minCount = [minCount, right - left + 1].min
          currentSum -= nums[left]
          left += 1
      end 
      right += 1
  end
  return minCount 
end

def length_of_longest_substring(s)
  maxCount = 0
  newArr = []
  left = 0

  if s.chars.uniq.length == s.length
      return s.length
  end

  s.each_char.with_index do |char, right|
      if !newArr.include?(char)
          newArr << char 
      else
          maxCount = [maxCount,newArr.length].max
          while newArr[left] != char
              newArr[left].pop
              left += 1
          end
          newArr = newArr.slice(idx + 1.. -1)
          newArr << char
      end
  end
  return [maxCount, newArr.length].max
end

def two_sum(nums, target)
  hash = {}

  nums.each_with_index do |num, i|
      diff = target - num
      if hash.has_key?(diff)
          return i, hash[diff]
      else
          hash[num] = i 
      end
  end
end

def contains_nearby_duplicate(nums, k)
  hash = {}

  nums.each_with_index do |num, i|
      if hash.has_key?(num) && i - hash[num] <= k
          return true
      else 
          hash[num] = i  
      end
  end
  return false
end

def summary_ranges(nums)
  start = nums[0]
  range = []
  nums.each_with_index do |num, i|
      if num + 1 != nums[i + 1]
          if start != num
              range << "#{start}->#{num}"
          else
              range << "#{start}"
          end
          start = nums[i + 1]
      end
  end
  return range
end

def merge(intervals)
  intervals.sort!
  merged = [intervals[0]]
  
  intervals[1..].each do |arr|
      if arr[0] <= merged[-1][1]
          merged[-1][1] = [merged[-1][1], arr[1]].max
      else
          merged << arr
      end
  end
  
  merged
end

class MinStack
  def initialize()
      @arr, @min = [], []
  end


=begin
  :type val: Integer
  :rtype: Void
=end
  def push(val)
      @arr.push(val)
      @min.push(val) if @min.empty? or val <= @min.last
  end


=begin
  :rtype: Void
=end
  def pop()
      @min.pop if @arr.pop == @min.last
  end


=begin
  :rtype: Integer
=end
  def top()
      @arr.last
  end


=begin
  :rtype: Integer
=end
  def get_min()
      @min.last
  end


end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
  return false if !head || !head.next

  tortoise, hare = head, head

  while hare && hare.next
      tortoise = tortoise.next
      hare = hare.next.next
      if tortoise == hare
          return true
      end
  end
  return false
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  # if !root
  #     return 0 
  # end

  # return 1 + [max_depth(root.left), max_depth(root.right)].max

  return 0 if root.nil?

  q = Queue.new
  q << root
  depth = 0 
  while q.size > 0
      q.size.times do
          node = q.pop
          q << node.left if node.left
          q << node.right if node.right
      end
      depth += 1
  end

  depth
end

def is_same_tree(p, q)
    if p.nil? && q.nil?
        return true
    end
    if p.nil? || q.nil? || p.val != q.val
        return false
    end

    return is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {TreeNode}
def invert_tree(root)
    return nil if root == nil 

    root.right, root.left = invert_tree(root.left), invert_tree(root.right)

    root
end

def jump(nums)
    jumps = 0 
    l = r = 0

    while r < nums.length - 1
        most = 0
        (l..r).each do |i|
            most = [most, i + nums[i]].max
        end
        l = r + 1
        r = most
        jumps += 1
    end
    return jumps
end

def product_except_self(nums)
    newArr = []
    prefix = 1
    nums.each_with_index do |num, i|
        newArr[i] = prefix
        prefix *= num
    end

    postfix = 1
    (nums.length - 1).downto(0) do |i|
        newArr[i] *= postfix
        postfix *= nums[i]
    end 
    return newArr
end