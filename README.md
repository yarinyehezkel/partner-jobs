# Partner Jobs Landing Page

קבצים:
- `index.html` — דף נחיתה לגיוס עובדים בפרטנר
- `thankyou.html` — עמוד תודה
- `admin.html` — ניהול משרות דינמי דרך Supabase Auth
- `supabase-schema.sql` — SQL להקמת טבלאות והרשאות
- `assets/` — תמונות וקראייטיבים

חיבורים:
- GTM: `GTM-WKKRWLTH`
- Supabase URL: `https://yiuastakbcntxbanhvgn.supabase.co`
- Webhook Make: מוגדר בתוך הקוד

לפני פרסום:
1. להריץ את `supabase-schema.sql` ב-Supabase SQL Editor.
2. ליצור משתמש Admin ב-Supabase Auth.
3. לגשת ידנית ל-`admin.html` לפי URL, להתחבר, ולוודא שהמשרות מופיעות. אין כפתור Admin בדף הראשי.
4. לשלוח ליד בדיקה ולבדוק שהוא הגיע גם ל-Make וגם לטבלת `leads`.
5. לבדוק ב-GTM Preview שהאירועים נטענים.

הערת אבטחה:
ה-Admin משתמש ב-Supabase Auth. אין לשים Service Role Key בקבצי HTML סטטיים.


## עדכון גרסה
- הקאבר הוחלף לתמונה החדשה שסופקה.
- נוסף שדה עיר בטופס ובשמירת הליד.
- הלוגו הוחלף ללוגואים השקופים שסופקו.
- הפונט נשאר Assistant כפי שהיה בגרסה הקודמת.
- נוספה ולידציה למספר נייד ישראלי.
