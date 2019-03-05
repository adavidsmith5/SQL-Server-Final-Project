USE db_library_management_system2
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tony Smith>
-- Create date: <3/3/2019>
-- Description:	<Find any borrowers who have bboks due on the current date>
-- =============================================
CREATE PROCEDURE dbo.booksDueToday

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a1.book_title, a2.borrower_name,
		a2.borrower_address
		FROM tbl_book_loans a3
		INNER JOIN tbl_books a1 ON a1.book_id = a3.loans_book_id
		INNER JOIN tbl_borrower a2 ON a2.borrower_card_no = a3.loans_card_no
		WHERE a3.loans_date_due = CONVERT(VARCHAR(10), getdate(), 111);
	;
END
GO
