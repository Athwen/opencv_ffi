#include <opencv2/opencv.hpp>

using namespace cv;
using namespace std;

struct image_data {
	int len;
	uint8_t *bytes;
};

struct dart_mat {
	int rows;
	int cols;
	int type;
	uint8_t *bytes;
};

extern "C" {
	__attribute__((visibility("default"))) __attribute__((used))
	dart_mat* dart_imdecode(image_data *input) {
		vector <uchar> v(input->bytes, input->bytes + input->len - 1);
		
		Mat src = imdecode(Mat(v), IMREAD_COLOR);

		struct dart_mat *data = (dart_mat*)malloc(sizeof(struct dart_mat));
		data->rows = src.rows;
		data->cols = src.cols;

		uint8_t *imgData = (uint8_t*)malloc(sizeof(uint8_t) * input->len);
		memcpy(imgData, src.data, input->len);
		data->bytes = imgData;

		return data;
	}
}