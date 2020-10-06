      SELECT "m"."Id", "m"."ContenT", "m"."DateRead", "m"."IsRead", "m"."MessageSent", "m"."ReciepientId", "m"."RecipientDeleted", "m"."RecipientId", 
	         "m"."SenderDeleted", "m"."SenderId", "u"."Id", "u"."City", "u"."Country", "u"."Created", "u"."DateOfBirth", "u"."Gender", "u"."Interests", 
			 "u"."Introduction", "u"."KnownAs", "u"."LastActive", "u"."LookingFor", "u"."PasswordHash", "u"."PasswordSalt", "u"."Username", "u0"."Id", 
			 "u0"."City", "u0"."Country", "u0"."Created", "u0"."DateOfBirth", "u0"."Gender", "u0"."Interests", "u0"."Introduction", "u0"."KnownAs",
			 "u0"."LastActive", "u0"."LookingFor", "u0"."PasswordHash", "u0"."PasswordSalt", "u0"."Username", "p"."Id", "p"."DateAdded", "p"."Description", 
			 "p"."PublicId", "p"."Url", "p"."UserId", "p"."isMain", "p0"."Id", "p0"."DateAdded", "p0"."Description", "p0"."PublicId", "p0"."Url", "p0"."UserId", "p0"."isMain"
      FROM "Messages" AS "m"
      INNER JOIN "Users" AS "u" ON "m"."SenderId" = "u"."Id"
      LEFT JOIN "Users" AS "u0" ON "m"."RecipientId" = "u0"."Id"
      LEFT JOIN "Photos" AS "p" ON "u"."Id" = "p"."UserId"
      LEFT JOIN "Photos" AS "p0" ON "u0"."Id" = "p0"."UserId"
      ORDER BY "m"."Id", "u"."Id", "p"."Id", "p0"."Id"