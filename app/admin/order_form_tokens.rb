ActiveAdmin.register OrderFormToken do
  menu parent: 'Order System', label: 'Order Form Token'

  record = OrderFormToken.column_names_excluded

  permit_params record

  index do
    record.each do |r|
      column r
    end
  end

  form do |f|
    f.inputs do
      f.input :expire_unit
      f.input :expire_at
    end

    f.actions
  end
end
