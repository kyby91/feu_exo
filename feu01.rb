#Rectangle

def check_arguments(arguments)
    if !arguments.size == 2
        return false
    end
    arguments.each do |argument|
        if argument.to_i <= 0
            return false
        end
    end
    return true
end

def display_rectangle(width, height)
    rectangle = []
    width = width.to_i
    height = height.to_i

    if width == 1
        2.times {rectangle.push("0")}
    else 
        2.times {rectangle.push(["0"].to_a.join('') + ["-"].cycle(width-2).to_a.join('') + ["0"].to_a.join(''))}
    end

    if height == 1
        rectangle.pop
    else
        (height - 2).times do
            rectangle.insert(1,(["|"].to_a.join('') + [" "].cycle(width-2).to_a.join('') + ["|"].to_a.join('')))
        end
    end

    return rectangle
end

check_arguments(ARGV) ? (puts display_rectangle(ARGV[0], ARGV[1])) : (puts "error") 