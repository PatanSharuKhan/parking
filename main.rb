require "./methods.rb"

BEGIN {
    system "clear"
    puts "*"*30
    puts "PARKING MANAGEMENT SYSTEM"
    puts "*"*30
    puts
}

parking=Parking.new

while true
    askTaskOption
    option=gets.chomp
    break if option=="0"
    activateTask option,parking
    sleep 1
end

END{
    system "clear"
    puts
    puts "*"*30
    puts "THANK YOU ! VISIT AGAIN !"
    puts "*"*30
}