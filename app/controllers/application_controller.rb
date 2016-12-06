class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :protect
  protect_from_forgery with: :exception

  def protect
    @ips = ['127.0.0.1', '192.168.1.0/24', '10.0.0.0/8', '192.168.0.0/16', '172.16.0.0/12', '94.231.16.0/20', '82.179.48.0/21', '79.133.86.128/25', '88.82.170.18', '79.133.86.143', '94.231.25.0/24', '10.2.8.0/24', '10.10.0.0/16', '10.12.0.0/14', '192.168.152.0/24', '192.168.154.0/24', '172.16.50.0/24', '172.20.20.0/24', '172.16.1.0/24', '172.16.13.0/24', '172.16.5.0/24', '192.168.0.0/24', '192.168.150.0/24', '172.22.22.0/24', '192.168.155.0/24', '172.16.0.0/24']
    allowed = false
    # Convert remote IP to an integer.
    bremote_ip = request.remote_ip.split('.').map(&:to_i).pack('C*').unpack('N').first
    @ips.each do |ipstring|
      ip, mask = ipstring.split '/'
      # Convert tested IP to an integer.
      bip = ip.split('.').map(&:to_i).pack('C*').unpack('N').first
      # Convert mask to an integer, and assume /32 if not specified.
      mask = mask ? mask.to_i : 32
      bmask = ((1 << mask) - 1) << (32 - mask)
      if bip & bmask == bremote_ip & bmask
        allowed = true
        break
      end
    end

    if not allowed
       render :text => "Доступ на сайт возможен только с внутренней сети университета"
       return
    end
  end
end
