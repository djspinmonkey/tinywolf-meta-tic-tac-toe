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
    @scroll_view.delegate = self

    @image_view = UIImageView.alloc.initWithImage(@image)
    @image_view.contentMode = UIViewContentModeScaleAspectFit
    @image_view.userInteractionEnabled = true
    @image_view.frame = @scroll_view.bounds

    @tap_grabber = UITapGestureRecognizer.alloc.initWithTarget(self, action: 'toggle_zoom')

    @scroll_view.addSubview(@image_view)
    @scroll_view.addGestureRecognizer(@tap_grabber)
    self.view = @scroll_view

    init
  end

  def viewForZoomingInScrollView(scroll_view)
    @image_view
  end

  def toggle_zoom
    @zoomed ? zoom_out : zoom_in
  end

  def zoom_out
    @scroll_view.setZoomScale(1.0, animated: true)
    @zoomed = false
  end

  def zoom_in
    frame_width  = @scroll_view.frame.size.width
    frame_height = @scroll_view.frame.size.height
    zone_width  = frame_width  / 3.0
    zone_height = frame_height / 3.0

    tapped = @tap_grabber.locationOfTouch(0, inView: @image_view)
    zone_x = (tapped.x / zone_width ).floor
    zone_y = (tapped.y / zone_height).floor
    puts "Zone: #{zone_x}, #{zone_y}"

    zoom_rect = CGRect.new
    zoom_rect.size.width  = zone_width
    zoom_rect.size.height = zone_height
    zoom_rect.origin.x = zone_x * frame_width  / 3
    zoom_rect.origin.y = zone_y * frame_height / 3

    @scroll_view.zoomToRect(zoom_rect, animated: true)

    @zoomed = true
  end

end
