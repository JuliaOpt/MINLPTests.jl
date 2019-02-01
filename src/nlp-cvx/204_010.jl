function nlp_cvx_204_010(optimizer)
    # Test Goals:
    # - linear objective
    # - intersection convex quadratic constraints
    # - rotated second order cone
    # Variants
    #   010 - intersection set
    
    m = Model(optimizer)
    
    @variable(m, x)
    @variable(m, y)
    @variable(m, z >= 0, start=0.1)
    
    @objective(m, Min, -y-x)
    @NLconstraint(m, x^2/z <= y)
    @NLconstraint(m, x^2 + y^2 <= -z+1)
    
    optimize!(m)
    
    check_status(m)
    check_objective(m, -1.2071067837918394)
    check_solution([x,y,z], [0.353553392657669, 0.8535533911341705, 0.14644661317207716])
    
end
