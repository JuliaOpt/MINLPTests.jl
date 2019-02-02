function nlp_003_011(optimizer, objective_tol, primal_tol, dual_tol;
        termination_target = JuMP.MOI.LOCALLY_SOLVED, 
        primal_target = JuMP.MOI.FEASIBLE_POINT)
    # Test Goals:
    # - non-linear objective and non-linear constraints
    # - NLobjective with offset
    
    m = Model(optimizer)
    
    @variable(m, x)
    @variable(m, y)
    
    @NLobjective(m, Max, sqrt(x+0.1) + pi)
    @NLconstraint(m, y >= exp(x-2) - 2)
    @NLconstraint(m, y <= sin(x)^2 + 2)
    
    optimize!(m)
    
    check_status(m, termination_target, primal_target)
    check_objective(m, 5.013178596805878, tol = objective_tol)
    check_solution([x,y], [3.4028339561149266, 2.0667085252601867], tol = primal_tol)
    
end

