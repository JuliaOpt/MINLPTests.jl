function nlp_cvx_105_012(optimizer)
    m = Model(optimizer)
    
    @variable(m, x, start=0.1)
    @variable(m, y)
    
    @objective(m, Min, x-y)
    @NLconstraint(m, exp(x-2.0) - 0.5 <= y)
    @NLconstraint(m, log(x) + 0.5 >= y)
    
    optimize!(m)
    
    check_status(m)
    check_objective(m, 1/2)
    check_solution([x,y], [1, 1/2])
    
end
