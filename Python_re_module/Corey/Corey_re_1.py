import re

text_to_search = '''
abcdefghijklmnopqurtuvwxyzabc
ABCDEFGHIJKLMNOPQRSTUVWXYZabc
1234567890abc


Ha HaHa

MetaCharacters (Need to be escaped):
. ^ $ * + ? { } [ ] \ | ( )

coreyms.com


321-555-4321
123.555.1234
123*555*1234
800-555-1234
900-555-1234

Mr. Schafer
Mr Smith
Ms Davis
Mrs. Robinson
Mr. T
'''

sentence = 'Start a sentence and then bring it to an end'

#print('\tTab')
#print(r'\tTab')

pattern = re.compile(r'abc')
matches = pattern.finditer(text_to_search)

for match in matches:
    print(match)

print('\n\n',  text_to_search[1:4])