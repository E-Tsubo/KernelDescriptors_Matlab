disp('Compiling matlabCV.cpp');
mex -I/opt/local/include/opencv -I/opt/local/include -L/opt/local/lib -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_ml -lopencv_video -lopencv_features2d -lopencv_calib3d -lopencv_objdetect -lopencv_contrib -lopencv_legacy -lopencv_flann matlabCV.cpp -o matlabCV

disp('Compiling opencvFunc.cpp');
mex -I/opt/local/include/opencv -I/opt/local/include -L/opt/local/lib -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_ml -lopencv_video -lopencv_features2d -lopencv_calib3d -lopencv_objdetect -lopencv_contrib -lopencv_legacy -lopencv_flann opencvFunc.cpp -o opencvFunc
