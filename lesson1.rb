class Lesson1
  def frog_jump (x, y, d)

    diff = y - x
    unless diff <= d
      if diff % d == 0
        return (diff / d)
      else
        return (diff / d) + 1
      end
    else
      if diff == 0
        return 0
      else
        return 1
      end
    end
  end

  def perm_missing_elem(a)
    return missing_element(a.sort!, 0)
  end

  def missing_element(a, start_index)
    puts a.to_s
    puts "start " + start_index.to_s
    if a.size == 0
      return start_index + 1
    else
      if a.size == 1
        if a[0] != start_index + 1
          return start_index + 1
        else
          return a[0] + 1
        end
      else
        middle = a.size / 2
        puts "middle " + middle.to_s
        puts "estimated " + (start_index + middle+1).to_s
        if a[middle] > (start_index + middle+1)
          return missing_element a[0..middle-1], start_index
        else
          return missing_element a[(middle+1)..(a.size-1)], (start_index + middle +1)
        end
      end
    end
  end

  def tape_equilibrium a
    total_right = a.inject(:+)
    total_left = 0
    results = Array.new
    a.each_with_index do |e, i|
      unless i == a.size - 1
        total_left = total_left + e
        total_right = total_right - e
        results << (total_left - total_right).abs
      end
    end
    results.sort!
    return results[0]
  end

end