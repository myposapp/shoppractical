class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Discover the foods from over\n3250 restaurants.");
  sliderModel.setTitle("Search for favorite\nfood near you");
  sliderModel.setImageAssetPath("assets/onboarding/1.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel
      .setDesc("Fast delivery to your home,\noffice and wherever you are.");
  sliderModel.setTitle("Fast delivery to\nyour place");
  sliderModel.setImageAssetPath("assets/onboarding/2.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Zero contact ordering,\ndelivery and takeaway.");
  sliderModel.setTitle("Safe delivery to\nyour home");
  sliderModel.setImageAssetPath("assets/onboarding/3.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
