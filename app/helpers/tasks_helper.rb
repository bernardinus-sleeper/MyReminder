module TasksHelper
  def ganti_nama_hari(hari)
    if hari=='0'
      hari='Minggu'
    elsif hari =='1'
      hari='Senin'
    elsif hari =='2'
      hari='Selasa'
    elsif hari =='3'
      hari='Rabu'
    elsif hari =='4'
      hari='Kamis'
    elsif hari =='5'
      hari='Jumat'
    elsif hari =='6'
      hari='Sabtu'
    end

    end
end
