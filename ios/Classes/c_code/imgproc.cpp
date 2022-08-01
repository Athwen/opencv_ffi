#include <opencv2/opencv.hpp>

using namespace cv;
using namespace std;

struct DartSize {
	int x;
	int y;
};



extern "C" {
	__attribute__((visibility("default"))) __attribute__((used))
	uint8_t* dartGaussianBlur(struct image_data *input, DartSize *ksize, double sigmaX, double sigmaY, int borderType){
		vector <uchar> v(input->bytes, bytes + input->len - 1);
		Mat src = imdecode(Mat(v), IMREAD_COLOR);
		Mat output;
		GaussianBlur(src, output, Size(ksize->x, ksize->y), sigmaX, sigmaY, borderType);

		
	}
}