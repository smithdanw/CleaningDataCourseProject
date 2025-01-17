# CODE BOOK
This code book describes the output of the run_analysis.R file.

## Columns
Below are the values captures by the return value of process_data
units of mean and std are those described in ./UCI HAR Dataset/features_info.txt

1 subject_id: integer (1:30)
2 activity_name: character
3 t_body_acc_mean_x
4 t_body_acc_mean_y
5 t_body_acc_mean_z
6 t_body_acc_std_x
7 t_body_acc_std_y
8 t_body_acc_std_z
9 gravity_acc_mean_x
10 gravity_acc_mean_y
11 gravity_acc_mean_z
12 gravity_acc_std_x
13 gravity_acc_std_y
14 gravity_acc_std_z
15 t_body_acc_jerkk_mean_x
16 t_body_acc_jerkk_mean_y
17 t_body_acc_jerkk_mean_z
18 t_body_acc_jerkk_std_x
19 t_body_acc_jerkk_std_y
20 t_body_acc_jerkk_std_z
21 t_body_gyro_mean_x
22 t_body_gyro_mean_y
23 t_body_gyro_mean_z
24 t_body_gyro_std_x
25 t_body_gyro_std_y
26 t_body_gyro_std_z
27 t_body_gyro_jerk_mean_x
28 t_body_gyro_jerk_mean_y
29 t_body_gyro_jerk_mean_z
30 t_body_gyro_jerk_std_x
31 t_body_gyro_jerk_std_y
32 t_body_gyro_jerk_std_z
33 t_body_acc_mag_mean
34 t_body_acc_mag_std
35 gravity_acc_mag_mean
36 gravity_acc_mag_std
37 t_body_acc_jerkkmag_mean
38 t_body_acc_jerkkmag_std
39 t_body_gyro_mag_mean
40 t_body_gyro_mag_std
41 t_body_gyro_jerk_mag_mean
42 t_body_gyro_jerk_mag_std
43 f_body_acc_mean_x
44 f_body_acc_mean_y
45 f_body_acc_mean_z
46 f_body_acc_std_x
47 f_body_acc_std_y
48 f_body_acc_std_z
49 f_body_acc_meanfreq_x
50 f_body_acc_meanfreq_y
51 f_body_acc_meanfreq_z
52 f_body_acc_jerkk_mean_x
53 f_body_acc_jerkk_mean_y
54 f_body_acc_jerkk_mean_z
55 f_body_acc_jerkk_std_x
56 f_body_acc_jerkk_std_y
57 f_body_acc_jerkk_std_z
58 f_body_acc_jerkk_meanfreq_x
59 f_body_acc_jerkk_meanfreq_y
60 f_body_acc_jerkk_meanfreq_z
61 f_body_gyro_mean_x
62 f_body_gyro_mean_y
63 f_body_gyro_mean_z
64 f_body_gyro_std_x
65 f_body_gyro_std_y
66 f_body_gyro_std_z
67 f_body_gyro_meanfreq_x
68 f_body_gyro_meanfreq_y
69 f_body_gyro_meanfreq_z
70 f_body_acc_mag_mean
71 f_body_acc_mag_std
72 f_body_acc_mag_meanfreq
73 f_body_bodyacc_jerkkmag_mean
74 f_body_bodyacc_jerkkmag_std
75 f_body_bodyacc_jerkkmag_meanfreq
76 f_body_bodygyro_mag_mean
77 f_body_bodygyro_mag_std
78 f_body_bodygyro_mag_meanfreq
79 f_body_bodygyro_jerk_mag_mean
80 f_body_bodygyro_jerk_mag_std
81 f_body_bodygyro_jerk_mag_meanfreq                

## Variables
Resulting variables are
har_totals - the entire data set
by_subject_by_activity - with the averages
