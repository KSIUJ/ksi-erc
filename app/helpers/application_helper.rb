module ApplicationHelper
  FLASH_TYPE_TO_BOOTSTRAP = {
    'success' => 'alert-success',
    'error' => 'alert-danger',
    'alert' => 'alert-warning',
    'notice' => 'alert-info',
  }

  def bootstrap_class_for flash_type
    FLASH_TYPE_TO_BOOTSTRAP[flash_type] || flash_type.to_s
  end
end
