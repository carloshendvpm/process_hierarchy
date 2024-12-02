LIFE_SPAN = {
  father: 60,
  child: 30,
  grandchild1: 12,
  grandchild2: 18
}

def simulate_life(role, lifespan)
  puts "#{role.capitalize} nasceu (PID: #{Process.pid})"
  lifespan.times do |year|
    sleep(1)
    puts "#{role.capitalize} tem #{year + 1} anos de idade (PID: #{Process.pid})"
  end
  puts "#{role.capitalize} morreu aos #{lifespan} anos (PID: #{Process.pid})"
end

def create_grandchild(role, lifespan, delay)
  sleep(delay)
  fork do
    simulate_life(role, lifespan)
  end
end

def create_child(role, lifespan, grandchild_role, grandchild_lifespan, grandchild_delay)
  fork do
    simulate_life(role, lifespan)

    create_grandchild(grandchild_role, grandchild_lifespan, grandchild_delay)

    Process.wait
  end
end

def simulate_family
  puts "Família começa (PID: #{Process.pid})"
  
  child1 = create_child("Filho 1", LIFE_SPAN[:child], "Neto 1", LIFE_SPAN[:grandchild1], 12)
  child2 = create_child("Filho 2", LIFE_SPAN[:child], "Neto 2", LIFE_SPAN[:grandchild2], 14)

  simulate_life("Pai", LIFE_SPAN[:father])

  Process.waitall
  puts "Família terminou (PID: #{Process.pid})"
end


simulate_family
