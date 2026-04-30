import os
EXTENSIONS = ['.txt', '.yml', '.py', '.ps1', '.gfx', '.gui']
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
def remove_comments_from_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    new_lines = []
    for line in lines:
        if line.strip().startswith('#'):
            continue
        if '#' in line:
            in_single = in_double = False
            new_line = ''
            for c in line:
                if c == '"' and not in_single:
                    in_double = not in_double
                elif c == "'" and not in_double:
                    in_single = not in_single
                if c == '#' and not in_single and not in_double:
                    break
                new_line += c
            line = new_line.rstrip() + '\n'
        if line.strip() == '':
            continue
        new_lines.append(line)
    with open(filepath, 'w', encoding='utf-8') as f:
        f.writelines(new_lines)
def process_directory(root_dir):
    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if any(filename.endswith(ext) for ext in EXTENSIONS):
                filepath = os.path.join(dirpath, filename)
                remove_comments_from_file(filepath)
if __name__ == '__main__':
    process_directory(ROOT)
    print('Alle Kommentare aus .txt, .yml, .py, .ps1, .gfx und .gui Dateien wurden entfernt.')
