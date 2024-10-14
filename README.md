<strong>Dependencies:</strong><br />
<a href="https://github.com/darktrovx/interact" target="_blank">Interact</a> by ChatDisabled, Devyn, Zoo and Snipe<br />
<a href="https://github.com/ItzMuri/progressbar/" target="_blank">Progressbar</a> by ItzMuri<br /><br />

<strong>Instructions: Quick Setup</strong><br />
Drop vivify_MailRobbery into your [standalone] folder.<br />
Drop the images inside of [images] into your [qb]/qb-inventory/html/images/ folder.<br />
Copy+Paste the following into your [qb]/qb-core/shared/items.lua:<br />
<pre>
per_mail = { name = 'per_mail', label = 'Personal Mail', weight = 50, type = 'item', image = 'per_mail.png', unique = true, useable = true, shouldClose = true, description = 'Personal Mail.  Open it?' },
gov_mail = { name = 'gov_mail', label = 'Government Mail', weight = 50, type = 'item', image = 'gov_mail.png', unique = true, useable = true, shouldClose = true, description = 'Government Mail.  Open it?' },
jnk_mail = { name = 'jnk_mail', label = 'Junk Mail', weight = 50, type = 'item', image = 'jnk_mail.png', unique = true, useable = true, shouldClose = false, description = 'Junk Mail.  Useless.' },
birthday_card = { name = 'birthday_card', label = 'Birthday Card', weight = 50, type = 'item', image = 'birthday_card.png', unique = false, useable = true, shouldClose = true, description = 'Happy Birthday to... someone...' },
grad_card = { name = 'grad_card', label = 'Graduation Card', weight = 50, type = 'item', image = 'grad_card.png', unique = false, useable = true, shouldClose = true, description = 'Congratulations!' },
western_union_check = { name = 'western_union_check', label = 'Western Union Check', weight = 50, type = 'item', image = 'western_union_check.png', unique = false, useable = false, shouldClose = false, description = 'Someone owed someone money.' },
random_letter = { name = 'random_letter', label = 'Random Letter', weight = 50, type = 'item', image = 'random_letter.png', unique = false, useable = false, shouldClose = false, description = 'Just a random letter.  Useless.' },
social_security = { name = 'social_security', label = 'Social Security Check', weight = 50, type = 'item', image = 'social_security.png', unique = false, useable = false, shouldClose = false, description = 'Try not to feel bad...' },
tax_return = { name = 'tax_return', label = 'Tax Return', weight = 50, type = 'item', image = 'tax_return.png', unique = false, useable = false, shouldClose = false, description = 'Someones tax return wooo!' },
</pre>
Restart your server.
