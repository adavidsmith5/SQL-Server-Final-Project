USE db_library_management_system2
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tony Smith>
-- Create date: <3/3/19>
-- Description:	<Finding borrowers who do not have any books currently checked out>
-- =============================================
CREATE PROCEDURE dbo.borrowersWithNoCheckOuts
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a1.borrower_name
		FROM tbl_borrower a1
		WHERE a1.borrower_card_no NOT IN (SELECT loans_card_no FROM tbl_book_loans)
	;
END
