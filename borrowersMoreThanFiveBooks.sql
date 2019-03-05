USE db_library_management_system2
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tony Smith>
-- Create date: <3/3/19>
-- Description:	<Find all borrowers with more than 5 books out>
-- =============================================
CREATE PROCEDURE dbo.borrowersMoreThanFiveBooks 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a1.borrower_name, a1.borrower_address, COUNT(a2.loans_card_no) AS books_loaned
		FROM tbl_borrower a1
		INNER JOIN tbl_book_loans a2 ON a2.loans_card_no = a1.borrower_card_no
		GROUP BY a1.borrower_name, a1.borrower_address
		HAVING COUNT(a2.loans_card_no) > 5
	;
END
