function nlp_cvx_103_011(optimizer, objective_tol, primal_tol, dual_tol)
    m = Model(optimizer)
    
    @variable(m, x)
    @variable(m, y)
    
    @objective(m, Min, -y)
    @NLconstraint(m, x^2 <= y)
    @NLconstraint(m, -x^2 + 1 >= y)
    
    optimize!(m)
    
    check_status(m)
    check_objective(m, -1, tol = objective_tol)
    check_solution([x,y], [0, 1], tol = primal_tol)
    
end

