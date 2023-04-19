CREATE PROCEDURE sp_timnhanvientheomnv @manv nvarchar(10)
AS
BEGIN
	SELECT * FROM NhanVien WHERE @manv = MaNV
END
EXEC sp_timnhanvientheomnv 'NV1'

CREATE FUNCTION fn_tongtien5ngaythang4 ()
RETURNS int
AS
BEGIN
	RETURN (SELECT Sum(TongTien) FROM KeToan WHERE NgayGG between '2023-04-01' and '2023-04-05')
END

SELECT dbo.fn_tongtien5ngaythang4()

ALTER FUNCTION fn_nvphucvubaonhieukhach (@manv nvarchar(10))
RETURNS @tb_soluong table (manv nvarchar(10), soluongkhachphucvu nvarchar(10))
AS
BEGIN
	INSERT INTO @tb_soluong SELECT MaNV, count(MaKH) FROM KeToan WHERE MaNV = @manv group by MaNV 
	RETURN 
END
SELECT * FROM fn_nvphucvubaonhieukhach('NV3')

CREATE TRIGGER trig_themnhanviendutuoi on NhanVien
FOR INSERT
AS
	DECLARE @tuoi int
	SET @tuoi = YEAR(GETDATE()) - (select YEAR(NgaySinh) from inserted)
	if (@tuoi < 18 or @tuoi > 65)
		begin
			print'Tuoi khong hop le'
			rollback transaction
		end

insert into NhanVien values ('NV6', 'Vương Gia Huy', 'Korea', '021312031', N'Nhân viên', '2020-2-3')

CREATE TRIGGER trig_xuatsoluongsaukhiinsert on MatHang
AFTER INSERT
AS
BEGIN
		BEGIN
			SELECT COUNT(MAMH) AS 'So Luong' FROM MatHang
		END
END

INSERT INTO MatHang values ('MH6', 'Lactolose', 'Gói', '10000', '200', '5')
