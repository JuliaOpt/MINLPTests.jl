m = Model(optimizer)

@variable(m, x)
@variable(m, y)

@objective(m, Min, (x-3)^2+(y-2)^2)
@constraint(m, 1*x-3*y <= 3)
@constraint(m, 1*x-5*y <= 0)
@constraint(m, 3*x+5*y >= 15)
@constraint(m, 7*x+2*y >= 20)
@constraint(m, 9*x+1*y >= 20)
@constraint(m, 3*x+7*y >= 17)

optimize!(m)

check_status(m)
check_objective(m, 0)
check_solution([x,y], [3, 2])
