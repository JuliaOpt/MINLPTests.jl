function nlp_003_016(optimizer, objective_tol, primal_tol, dual_tol)
    # Test Goals:
    # - objective with offset
    
    m = Model(solver = optimizer)
    
    @variable(m, x)
    @variable(m, y)
    
    @objective(m, Max, x + pi)
    @NLconstraint(m, y >= exp(x-2) - 2)
    @NLconstraint(m, y <= sin(x)^2 + 2)
    
    status = solve(m)
    
    check_status(status)
    check_objective(m, 6.544426610294042, tol = objective_tol)
    check_solution([x,y], [3.4028339561149266, 2.0667085252601867], tol = primal_tol)
    
end

