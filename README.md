# Code Explanations
A Study of Visualization Approaches and Fractal Dimension Classification of Certain Boolean Networks

The attached codes are all compatible with MatLab_R2020b. These codes are all used directly or indirectly in the MA Thesis of Gretchen Boxdorfer. Explanation of the use of each code is as follows: 

To create the grid outputs for the networks, we use "Grid_Network_Sum.m" and "All_Grid_Network_Sum.m". The former can only run totalistic rules, the latter can run all ECA Rules (and any binary rules, beyond ECA). The codes "Grid_Sum_Monte_Carlo_Dora.m" and "All_Grid_Sum_Monte.m" were used for the Monte Carlo simulations of correspoding networks. The codes "Grid_Sum_Analysis.m" and "All_Grid_Sum_NoPlot.m" were used to find the fractal dimension d of networks without plotting the outcome. The code "PatternFormationPlots_FasterVersion.m" was used as a base for some of these codes. 

The code "All_Grid_Network_Sum_Subplots.m" creates the grid output with the two orientations, one focused on iterations and the other on nodes.

The code "ClassSize_Class_Rule_N_d_Stats-2.m" and the corresponding file "ClassSize_Class_Rule_N_d.txt" were used in the ANOVA of the fractal dimensions of the ECA by the 4 classes of behavior. 

Finally, the codes "binary_rule.m", "one_network_iteration_rules.m", "one_network_iteration_generalizedRule22.m", "parents_CA_includingthenode.m", "parents_random.m", and "randominitialstate.m" are support codes necessarily used within other codes. 
