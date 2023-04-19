USE QuanLyDuocPham
create login GiaHuy1 with password ='123'
create user GiaHuy for login GiaHuy1
GRANT SELECT ON KhachHang to GiaHuy

grant select on KhachHang to GiaHuy with grant option