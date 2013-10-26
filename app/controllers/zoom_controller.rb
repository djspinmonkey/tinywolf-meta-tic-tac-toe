class ZoomController < UIViewController

  def initWithImage(image)
    self.title = "Xs&(Xs&Os)&Os"
    @image = image

    @scroll_view = UIScrollView.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    @scroll_view.scrollEnabled = false
    @scroll_view.clipsToBounds = false
    @scroll_view.contentSize = @image.size
    @scroll_view.minimumZoomScale = 1.0
    @scroll_view.maximumZoomScale = 4.0
    @scroll_view.delegate = self # OMG DIE IN A FIRE APPLE

    @image_view = UIImageView.alloc.initWithImage(@image)
    @image_view.contentMode = UIViewContentModeScaleAspectFit
    @image_view.userInteractionEnabled = true
    @image_view.frame = @scroll_view.bounds

    tap_grabber = UITapGestureRecognizer.alloc.initWithTarget(self, action: 'toggle_zoom')

    @scroll_view.addSubview(@image_view)
    @scroll_view.addGestureRecognizer(tap_grabber)
    self.view = @scroll_view

    init
  end

  def toggle_zoom
    @zoomed ? zoom_out : zoom_in
  end

  def zoom_in
    zoom_to_scale 2.0
    @zoomed = true
  end

  def zoom_out
    zoom_to_scale 1.0
    @zoomed = false
  end

  def zoom_to_scale(scale)
    puts "zooming to #{scale}"
    zoom_rect = CGRect.new

    frame_height = @scroll_view.frame.size.height
    frame_width  = @scroll_view.frame.size.width

    zoom_rect.size.height = frame_height / scale
    zoom_rect.size.width  = frame_width  / scale

    zoom_rect.origin.x = (frame_width  - zoom_rect.size.width  ) / 2.0
    zoom_rect.origin.y = (frame_height - zoom_rect.size.height ) / 2.0

    @scroll_view.zoomToRect(zoom_rect, animated: true)
  end

  def viewForZoomingInScrollView(scroll_view)
    @image_view
  end

end
