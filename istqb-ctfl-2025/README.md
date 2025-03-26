[Udemy Course Link](https://www.udemy.com/course/accredited-istqb-certified-tester-foundation-level-course/learn/lecture/40884026?components=add_to_cart%2Cavailable_coupons%2Cbase_purchase_section%2Cbuy_button%2Cbuy_for_team%2Ccacheable_buy_button%2Ccacheable_deal_badge%2Ccacheable_discount_expiration%2Ccacheable_price_text%2Ccacheable_purchase_text%2Ccurated_for_ufb_notice_context%2Ccurriculum_context%2Cdeal_badge%2Cdiscount_expiration%2Cgift_this_course%2Cincentives%2Cinstructor_links%2Clifetime_access_context%2Cmoney_back_guarantee%2Cprice_text%2Cpurchase_tabs_context%2Cpurchase%2Crecommendation%2Credeem_coupon%2Csidebar_container%2Cpurchase_body_container%2Cone_click_checkout#overview)

**Sample Exams**

# generate_toc.js
### What This Does
1. Creates home.md (Table of Contents)
2. Adds "🔙 Home" to the top of each Markdown file
3. Prevents duplicate back links by removing old ones first
4. Encodes URLs correctly (fixing spaces in links)
5. Sorts everything alphabetically

### How to Use It
1. Save the script as generate_toc.js
2. Run it `node generate_toc.js`

### Automate it - NEEDS TESTING
1. Open the Git hooks directory:
```shell
cd your-repo/.git/hooks
```
2. Create/Edit `post-commit` hook
```shell
notepad post-commit
```
3. Add the below script
```shell
#!/bin/sh
node istqb-ctfl-2025/generate_toc.js
git add istqb-ctfl-2025/.
git commit --amend --no-edit
```
#### Not sure this is necessary
4. Make it executable
```shell
chmod +x post-commit
```