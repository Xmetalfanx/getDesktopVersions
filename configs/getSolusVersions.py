import requests
from bs4 import BeautifulSoup

URL = "https://soluspkg.osyn.us/?dev=1"


def get_package_version(pkg_name):
    # Fetch page
    r = requests.get(URL)
    r.raise_for_status()

    soup = BeautifulSoup(r.text, "html.parser")

    # The site uses <table> → <tr> rows → <td> cells
    rows = soup.find_all("tr")

    for row in rows:
        cols = row.find_all("td")
        if len(cols) < 2:
            continue

        name = cols[0].get_text(strip=True)
        version = cols[1].get_text(strip=True)

        # case-insensitive match
        if name.lower() == pkg_name.lower():
            return version

    return None


if __name__ == "__main__":
    package = "mate-desktop"
    version = get_package_version(package)

    if version:
        print(f"{package} version in Solus repo: {version}")
    else:
        print(f"{package} not found on Solus package site.")
