class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    image = UIImage.imageNamed("tiny wolf sketch.jpg")

    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.rootViewController = ZoomController.alloc.initWithImage(image)
    @window.makeKeyAndVisible

    true
  end
end
