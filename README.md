# .scripts

| utli       | type        | next step                                                                      |
| ---------- | ----------- | ------------------------------------------------------------------------------ |
| gitout     | in progress | update with gum                                                                |
| sorter     | in progress | внедрить нейронку для сортировки  по смыслу файла                              |
| git-com    | in progress | писать текст комита нейронка                                                   | 
| gitdiff    | in progress | update with gum                                                                |
| unpacker   | in progress | сделать так чтобы можно было распаковывать только одну папку (update with gum) |
| git-branch | in progress | Выбор действия над веткой                                                      |

## gitout.sh (chat gpt)

Проверяет папки на наличее git репозитория

## sorter.sh (chat gpt)

Сортирует все файлы по расщирениям

## git-com.sh 

Утилита для commit (удобная красивая ...)

Версии:
1. Взята с [github](https://github.com/charmbracelet/gum?ysclid=lj6z9zhjoy292635507)

## gitdiff.sh

Утилита для сравнения веток на изменения с текущей

Версии:
1. Пока говно но планирую улучшить

## unpacker.sh (chat gpt)

Утилита для распаковки всех папок

### Пример
```было
.
├── test
│   ├── test0.md
│   ├── test1.md
│   └── test2.md
└── test2
    ├── test20.md
    ├── test21.md
    └── test22.md
```

```стало
.
├── test0.md
├── test1.md
├── test2.md
├── test20.md
├── test21.md
└── test22.md
```

## git-branch.sh

Утилита для работы с ветками в git

Версии:
1. Переход по веткам
