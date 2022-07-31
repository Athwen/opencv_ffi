#include <opencv2/opencv.hpp>

using namespace cv;
using namespace std;

// Avoiding name mangling
extern "C" {

    __attribute__((visibility("default"))) __attribute__((used))
    void process_image(char* inputImagePath, char* outputImagePath) {
        Mat input = imread(inputImagePath, IMREAD_GRAYSCALE);
        Mat threshed, withContours;

        vector<vector<Point>> contours;
        vector<Vec4i> hierarchy;
        
        adaptiveThreshold(input, threshed, 255, ADAPTIVE_THRESH_GAUSSIAN_C, THRESH_BINARY_INV, 77, 6);
        findContours(threshed, contours, hierarchy, RETR_TREE, CHAIN_APPROX_TC89_L1);
        
        cvtColor(threshed, withContours, COLOR_GRAY2BGR);
        drawContours(withContours, contours, -1, Scalar(0, 255, 0), 4);
        
        imwrite(outputImagePath, withContours);
    }
}