------------------------------------------------------------
-- 1. ALTER PRODUCTLIST TO ADD PRICE AND DESCRIPTION
------------------------------------------------------------
ALTER TABLE PRODUCTLIST
ADD (
    PRICE NUMBER(6,2),
    DESCRIPTION VARCHAR2(250)
);

------------------------------------------------------------
-- 2. UPDATE PRODUCTLIST WITH DATA FROM STOREFRONT
-- (Assuming STOREFRONT has PRODUCTCODE, PRICE, DESCRIPTION)
------------------------------------------------------------
UPDATE PRODUCTLIST P
SET (P.PRICE, P.DESCRIPTION) =
    (SELECT S.PRICE, S.DESCRIPTION
     FROM STOREFRONT S
     WHERE S.PRODUCTCODE = P.PRODUCTCODE);

------------------------------------------------------------
-- 3. DROP THE STOREFRONT TABLE
------------------------------------------------------------
DROP TABLE STOREFRONT;

------------------------------------------------------------
-- 4. CREATE CHATLOG TABLE
------------------------------------------------------------
CREATE TABLE CHATLOG (
    CHATID NUMBER(3),
    RECEIVERID NUMBER(3),
    SENDERID NUMBER(3),
    DATESENT DATE,
    CONTENT VARCHAR2(250),
    CONSTRAINT CHATLOG_PK PRIMARY KEY (CHATID),
    CONSTRAINT CHATLOG_RECEIVER_FK FOREIGN KEY (RECEIVERID)
        REFERENCES USERBASE(USERID),
    CONSTRAINT CHATLOG_SENDER_FK FOREIGN KEY (SENDERID)
        REFERENCES USERBASE(USERID)
);

------------------------------------------------------------
-- 5. INSERT SAMPLE DATA INTO CHATLOG
------------------------------------------------------------
INSERT INTO CHATLOG VALUES (1, 101, 102, SYSDATE-10, 'Hey, want to play later?');
INSERT INTO CHATLOG VALUES (2, 102, 101, SYSDATE-9, 'Sure, what time?');
INSERT INTO CHATLOG VALUES (3, 103, 101, SYSDATE-8, 'Did you see the update?');
INSERT INTO CHATLOG VALUES (4, 101, 103, SYSDATE-8, 'Yeah, looks great!');
INSERT INTO CHATLOG VALUES (5, 104, 105, SYSDATE-7, 'Add me as a friend!');
INSERT INTO CHATLOG VALUES (6, 105, 104, SYSDATE-7, 'Done!');
INSERT INTO CHATLOG VALUES (7, 106, 101, SYSDATE-6, 'Help me with this quest?');
INSERT INTO CHATLOG VALUES (8, 101, 106, SYSDATE-6, 'Sure, join my lobby.');
INSERT INTO CHATLOG VALUES (9, 107, 108, SYSDATE-5, 'GG last match!');
INSERT INTO CHATLOG VALUES (10, 108, 107, SYSDATE-5, 'Thanks!');

------------------------------------------------------------
-- 6. CREATE FRIENDSLIST TABLE
------------------------------------------------------------
CREATE TABLE FRIENDSLIST (
    USERID NUMBER(3),
    FRIENDID NUMBER(3),
    CONSTRAINT FRIENDSLIST_PK PRIMARY KEY (USERID, FRIENDID),
    CONSTRAINT FRIENDSLIST_USER_FK FOREIGN KEY (USERID)
        REFERENCES USERBASE(USERID),
    CONSTRAINT FRIENDSLIST_FRIEND_FK FOREIGN KEY (FRIENDID)
        REFERENCES USERBASE(USERID)
);

------------------------------------------------------------
-- 7. INSERT SAMPLE DATA INTO FRIENDSLIST
------------------------------------------------------------
INSERT INTO FRIENDSLIST VALUES (101, 102);
INSERT INTO FRIENDSLIST VALUES (102, 101);
INSERT INTO FRIENDSLIST VALUES (101, 103);
INSERT INTO FRIENDSLIST VALUES (103, 101);
INSERT INTO FRIENDSLIST VALUES (104, 105);
INSERT INTO FRIENDSLIST VALUES (105, 104);
INSERT INTO FRIENDSLIST VALUES (106, 101);
INSERT INTO FRIENDSLIST VALUES (101, 106);
INSERT INTO FRIENDSLIST VALUES (107, 108);
INSERT INTO FRIENDSLIST VALUES (108, 107);

------------------------------------------------------------
-- 8. CREATE WISHLIST TABLE
------------------------------------------------------------
CREATE TABLE WISHLIST (
    USERID NUMBER(3),
    PRODUCTCODE VARCHAR2(5),
    POSITION NUMBER(3),
    CONSTRAINT WISHLIST_PK PRIMARY KEY (USERID, PRODUCTCODE),
    CONSTRAINT WISHLIST_USER_FK FOREIGN KEY (USERID)
        REFERENCES USERBASE(USERID),
    CONSTRAINT WISHLIST_PRODUCT_FK FOREIGN KEY (PRODUCTCODE)
        REFERENCES PRODUCTLIST(PRODUCTCODE)
);

------------------------------------------------------------
-- 9. INSERT SAMPLE DATA INTO WISHLIST
------------------------------------------------------------
INSERT INTO WISHLIST VALUES (101, 'P001', 1);
INSERT INTO WISHLIST VALUES (101, 'P002', 2);
INSERT INTO WISHLIST VALUES (102, 'P003', 1);
INSERT INTO WISHLIST VALUES (103, 'P004', 1);
INSERT INTO WISHLIST VALUES (103, 'P005', 2);
INSERT INTO WISHLIST VALUES (104, 'P006', 1);
INSERT INTO WISHLIST VALUES (105, 'P007', 1);
INSERT INTO WISHLIST VALUES (106, 'P008', 1);
INSERT INTO WISHLIST VALUES (107, 'P009', 1);
INSERT INTO WISHLIST VALUES (108, 'P010', 1);

------------------------------------------------------------
-- 10. CREATE USERPROFILE TABLE
------------------------------------------------------------
CREATE TABLE USERPROFILE (
    USERID NUMBER(3),
    IMAGEFILE VARCHAR2(250),
    DESCRIPTION VARCHAR2(250),
    CONSTRAINT USERPROFILE_PK PRIMARY KEY (USERID),
    CONSTRAINT USERPROFILE_USER_FK FOREIGN KEY (USERID)
        REFERENCES USERBASE(USERID)
);

------------------------------------------------------------
-- 11. INSERT SAMPLE DATA INTO USERPROFILE
------------------------------------------------------------
INSERT INTO USERPROFILE VALUES (101, '/img/user101.png', 'Casual gamer who loves RPGs.');
INSERT INTO USERPROFILE VALUES (102, '/img/user102.png', 'Competitive FPS player.');
INSERT INTO USERPROFILE VALUES (103, '/img/user103.png', 'Strategy games enthusiast.');
INSERT INTO USERPROFILE VALUES (104, '/img/user104.png', 'I like co‑op adventures.');
INSERT INTO USERPROFILE VALUES (105, '/img/user105.png', 'Speedrunner.');
INSERT INTO USERPROFILE VALUES (106, '/img/user106.png', 'MMO grinder.');
INSERT INTO USERPROFILE VALUES (107, '/img/user107.png', 'Retro game collector.');
INSERT INTO USERPROFILE VALUES (108, '/img/user108.png', 'Streamer and content creator.');
INSERT INTO USERPROFILE VALUES (109, '/img/user109.png', 'Puzzle solver.');
INSERT INTO USERPROFILE VALUES (110, '/img/user110.png', 'New to gaming!');

------------------------------------------------------------
-- 12. CREATE SECURITYQUESTION TABLE
------------------------------------------------------------
CREATE TABLE SECURITYQUESTION (
    QUESTIONID NUMBER,
    USERID NUMBER(3),
    QUESTION VARCHAR2(250),
    ANSWER VARCHAR2(250),
    CONSTRAINT SECURITYQUESTION_PK PRIMARY KEY (QUESTIONID),
    CONSTRAINT SECURITYQUESTION_USER_FK FOREIGN KEY (USERID)
        REFERENCES USERBASE(USERID)
);

------------------------------------------------------------
-- 13. INSERT SAMPLE DATA INTO SECURITYQUESTION
------------------------------------------------------------
INSERT INTO SECURITYQUESTION VALUES (1, 101, 'What is your favorite game?', 'Halo');
INSERT INTO SECURITYQUESTION VALUES (2, 102, 'What is your pet’s name?', 'Rex');
INSERT INTO SECURITYQUESTION VALUES (3, 103, 'Where were you born?', 'Chicago');
INSERT INTO SECURITYQUESTION VALUES (4, 104, 'Favorite childhood toy?', 'Lego');
INSERT INTO SECURITYQUESTION VALUES (5, 105, 'Mother’s maiden name?', 'Smith');
INSERT INTO SECURITYQUESTION VALUES (6, 106, 'Favorite movie?', 'Inception');
INSERT INTO SECURITYQUESTION VALUES (7, 107, 'Dream vacation spot?', 'Japan');
INSERT INTO SECURITYQUESTION VALUES (8, 108, 'Favorite food?', 'Pizza');
INSERT INTO SECURITYQUESTION VALUES (9, 109, 'First car model?', 'Civic');
INSERT INTO SECURITYQUESTION VALUES (10, 110, 'Favorite color?', 'Blue');

------------------------------------------------------------
-- 14. CREATE COMMUNITYRULES TABLE
------------------------------------------------------------
CREATE TABLE COMMUNITYRULES (
    RULENUM NUMBER(3),
    TITLE VARCHAR2(250),
    DESCRIPTION VARCHAR2(250),
    SEVERITYPOINT NUMBER(4),
    CONSTRAINT COMMUNITYRULES_PK PRIMARY KEY (RULENUM)
);

------------------------------------------------------------
-- 15. INSERT SAMPLE DATA INTO COMMUNITYRULES
------------------------------------------------------------
INSERT INTO COMMUNITYRULES VALUES (1, 'No Harassment', 'Do not harass or bully other users.', 100);
INSERT INTO COMMUNITYRULES VALUES (2, 'No Cheating', 'Use of cheats or exploits is prohibited.', 90);
INSERT INTO COMMUNITYRULES VALUES (3, 'No Spam', 'Avoid excessive or irrelevant messaging.', 40);
INSERT INTO COMMUNITYRULES VALUES (4, 'Respect Privacy', 'Do not share personal information.', 80);
INSERT INTO COMMUNITYRULES VALUES (5, 'No Hate Speech', 'Hate speech is strictly forbidden.', 120);
INSERT INTO COMMUNITYRULES VALUES (6, 'Report Bugs', 'Report issues responsibly.', 20);
INSERT INTO COMMUNITYRULES VALUES (7, 'Fair Play', 'Play fairly and respect others.', 60);
INSERT INTO COMMUNITYRULES VALUES (8, 'No Impersonation', 'Do not impersonate others.', 70);
INSERT INTO COMMUNITYRULES VALUES (9, 'No NSFW Content', 'Explicit content is not allowed.', 110);
INSERT INTO COMMUNITYRULES VALUES (10, 'Follow Staff Instructions', 'Comply with moderator requests.', 50);

------------------------------------------------------------
-- 16. CREATE INFRACTIONS TABLE
------------------------------------------------------------
CREATE TABLE INFRACTIONS (
    INFRACTIONID NUMBER,
    USERID NUMBER(3),
    RULENUM NUMBER(3),
    DATEASSIGNED DATE,
    PENALTY VARCHAR2(250),
    CONSTRAINT INFRACTIONS_PK PRIMARY KEY (INFRACTIONID),
    CONSTRAINT INFRACTIONS_USER_FK FOREIGN KEY (USERID)
        REFERENCES USERBASE(USERID),
    CONSTRAINT INFRACTIONS_RULE_FK FOREIGN KEY (RULENUM)
        REFERENCES COMMUNITYRULES(RULENUM)
);

------------------------------------------------------------
-- 17. INSERT SAMPLE DATA INTO INFRACTIONS
------------------------------------------------------------
INSERT INTO INFRACTIONS VALUES (1, 101, 3, SYSDATE-20, 'Warning issued');
INSERT INTO INFRACTIONS VALUES (2, 102, 1, SYSDATE-15, '24-hour chat ban');
INSERT INTO INFRACTIONS VALUES (3, 103, 2, SYSDATE-10, 'Account suspension');
INSERT INTO INFRACTIONS VALUES (4, 104, 4, SYSDATE-8, 'Warning issued');
INSERT INTO INFRACTIONS VALUES (5, 105, 5, SYSDATE-7, '72-hour ban');
INSERT INTO INFRACTIONS VALUES (6, 106, 7, SYSDATE-6, 'Warning issued');
INSERT INTO INFRACTIONS VALUES (7, 107, 9, SYSDATE-5, 'Content removal');
INSERT INTO INFRACTIONS VALUES (8, 108, 8, SYSDATE-4, 'Warning issued');
INSERT INTO INFRACTIONS VALUES (9, 109, 6, SYSDATE-3, 'No penalty');
INSERT INTO INFRACTIONS VALUES (10, 110, 10, SYSDATE-2, 'Moderator review');

------------------------------------------------------------
-- 18. CREATE USERSUPPORT TABLE
------------------------------------------------------------
CREATE TABLE USERSUPPORT (
    TICKETID NUMBER,
    EMAIL VARCHAR2(250),
    ISSUE VARCHAR2(250),
    DATESUBMITTED DATE,
    DATEUPDATED DATE,
    STATUS VARCHAR2(250),
    CONSTRAINT USERSUPPORT_PK PRIMARY KEY (TICKETID)
);

------------------------------------------------------------
-- 19. INSERT SAMPLE DATA INTO USERSUPPORT
------------------------------------------------------------
INSERT INTO USERSUPPORT VALUES (1, 'user101@mail.com', 'Login issue', SYSDATE-5, SYSDATE-4, 'NEW');
INSERT INTO USERSUPPORT VALUES (2, 'user102@mail.com', 'Payment failed', SYSDATE-6, SYSDATE-3, 'IN PROGRESS');
INSERT INTO USERSUPPORT VALUES (3, 'user103@mail.com', 'Bug report', SYSDATE-10, SYSDATE-9, 'CLOSED');
INSERT INTO USERSUPPORT VALUES (4, 'user104@mail.com', 'Friend list not loading', SYSDATE-4, SYSDATE-2, 'NEW');
INSERT INTO USERSUPPORT VALUES (5, 'user105@mail.com', 'Game crash', SYSDATE-7, SYSDATE-6, 'IN PROGRESS');
INSERT INTO USERSUPPORT VALUES (6, 'user106@mail.com', 'Refund request', SYSDATE-8, SYSDATE-7, 'CLOSED');
INSERT INTO USERSUPPORT VALUES (7, 'user107@mail.com', 'Profile picture not updating', SYSDATE-3, SYSDATE-1, 'NEW');
INSERT INTO USERSUPPORT VALUES (8, 'user108@mail.com', 'Chat not working', SYSDATE-2, SYSDATE-1, 'IN PROGRESS');
INSERT INTO USERSUPPORT VALUES (9, 'user109@mail.com', 'Password reset issue', SYSDATE-9, SYSDATE-8, 'CLOSED');
INSERT INTO USERSUPPORT VALUES (10, 'user110@mail.com', 'Wishlist bug', SYSDATE-1, SYSDATE, 'NEW');

------------------------------------------------------------
-- 20. VIEW: UNIQUE SECURITY QUESTIONS
------------------------------------------------------------
CREATE OR REPLACE VIEW UNIQUE_SECURITY_QUESTIONS AS
SELECT DISTINCT QUESTION
FROM SECURITYQUESTION;

------------------------------------------------------------
-- 21. VIEW: ACTIVE SUPPORT TICKETS
------------------------------------------------------------
CREATE OR REPLACE VIEW ACTIVE_SUPPORT_TICKETS AS
SELECT TICKETID, EMAIL, ISSUE, DATEUPDATED
FROM USERSUPPORT
WHERE STATUS IN ('NEW', 'IN PROGRESS')
ORDER BY DATEUPDATED;
