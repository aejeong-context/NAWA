	SELECT R.MR_ID, MR_NAME, MR_EMAIL, MI_NCK, MR_RGD, MR_DFL, MR_VISITED, MI_CONDITION, MR_AUTH, MI_PHONE, MI_LC, MI_INTEREST, MI_PROFILE, MI_ATTEND_CNT, MI_OPEN_CNT
		FROM MR R INNER JOIN MI I
		ON R.MR_ID = I.MR_ID
			WHERE R.MR_ID = 'akkang92';