const categoryOrder = [
  'CPU', 'CPU Cooler', 'Motherboard', 'Memory',
  'Storage', 'GPU', 'PSU', 'Case'
];

const numericSpecsMap = {
	CPU:            ['cores','core_clock','boost_clock','tdp'],
	'CPU Cooler':   ['fan_rpm', 'noise_level', 'radiator_size', 'height'],
	Motherboard:    ['memory_max','ram_slots','m2_slots','sata_ports'],
	Memory:         ['modules','capacity'],
	GPU:            ['length','tdp'],
	PSU:            ['wattage'],
	Case:           ['max_cpu_cooler_height','max_gpu_length','hdd_bays','ssd_bays']
};

const filterDisplayLabelMap = {
	//CPU specs
	cores:                  'Cores',                core_clock:             'Core Clock(GHz)',
	boost_clock:            'Boost Clock(GHz)',      tdp:                    'TDP(W)',
	//Cooler specs
	fan_rpm:                'RPM',                   noise_level:            'Noise(dB)',
	radiator_size:          'Radiator Size(mm)',     height:                 'Height(mm)',
	//Motherboard specs
	memory_max:             'Max Memory(GB)',        ram_slots:              'RAM Slots',
	m2_slots:               'M.2 Slots',             sata_ports:             'SATA Ports',
	//Memory specs
	modules:                'Modules',               capacity:               'Capacity(GB)',
	//GPU specs
	length:                 'Length(mm)',
	//PSU specs
	wattage:                'Wattage(W)',
	//Case specs
	max_cpu_cooler_height:  'Max Cooler Height(mm)', max_gpu_length:         'Max GPU Length(mm)',
	hdd_bays:               'HDD Bays',              ssd_bays:               'SSD Bays',
};

let currentItems = [];

document.addEventListener('DOMContentLoaded', () => {
    const select       = document.getElementById('categorySelect');
    const tableHeader  = document.getElementById('tableHeader');
    const tableBody    = document.getElementById('tableBody');
    const searchBtn    = document.getElementById('searchBtn');
    const searchInput  = document.getElementById('searchInput');
    const currentBody  = document.getElementById('currentBody');
    const currentTotal = document.getElementById('currentTotal');
    const savedBody    = document.getElementById('savedBody');
    const filtersContainer = document.getElementById('filters');
    const isPublic     = document.getElementById('publicCheckbox').checked ? 1 : 0;
    let currentItems   = [];

    // Configuration for each category: table headers and keys to read from Local DB server
    const displayMap = {
        'CPU': {
          headers: ['Manufacturer','Model','Socket','Cores','Core Clock(GHz)','Boost Clock(GHz)','Microarchitecture','TDP(W)','iGPU','Price($)'],
          keys:    ['manufacturer','model','socket','cores','core_clock','boost_clock','architecture','tdp','integrated_graphics','price']
        },
        'CPU Cooler': {
          headers: ['Manufacturer','Model','RPM','Noise(dB)','Color','Radiator Size(mm)','Height(mm)','Price($)'],
          keys:    ['manufacturer','model','fan_rpm','noise_level','color','radiator_size','height','price']
        },
        'Motherboard': {
          headers: ['Manufacturer','Model','Socket','Form','Max Memory(GB)','Slots','M.2','SATA','Color','Price($)'],
          keys:    ['manufacturer','model','socket','form_factor','memory_max','ram_slots','m2_slots','sata_ports','color','price']
        },
        'Memory': {
          headers: ['Manufacturer','Model','Speed(MHz)','Modules','Capacity(GB)','Type','Color','Price($)'],
          keys:    ['manufacturer','model','speed','modules','capacity','type','color','price']
        },
        'Storage': {
          headers: ['Manufacturer','Model','Capacity(GB)','Type','Cache(MB)','Form','Interface','Price($)'],
          keys:    ['manufacturer','model','capacity','type','cache','form_factor','interface','price']
        },
        'GPU': {
          headers: ['Manufacturer','Model','Chipset','Memory(GB)','Core(MHz)','Boost(MHz)','Length(mm)','TDP(W)','Power','Interface','Price($)'],
          keys:    ['manufacturer','model','chipset','memory','core_clock','boost_clock','length','tdp','power_connectors','interface','price']
        },
        'PSU': {
          headers: ['Manufacturer','Model','Wattage(W)','Efficiency','Mod','Color','Form','Price($)'],
          keys:    ['manufacturer','model','wattage','efficiency','modularity','color','form_factor','price']
        },
        'Case': {
          headers: ['Manufacturer','Model','Type','Panel','HDD Bays','SSD Bays','Vol(L)','Color','Max GPU(mm)','Max CPU(mm)','PSU Form','Price($)'],
          keys:    ['manufacturer','model','type','side_panel','hdd_bays','ssd_bays','volume','color','max_gpu_length','max_cpu_cooler_height','psu_form_factor','price']
        }
    };

    // Populate the category dropdown
    Object.keys(displayMap).forEach(cat => {
      const opt = document.createElement('option'); 
      opt.value = cat; 
      opt.textContent = cat; 
      select.appendChild(opt);
    });
    
    // Initial data load
    select.addEventListener('change', () => {
        searchInput.value = ''; 
        loadParts();
        generateFilters(select.value);
    });

    select.addEventListener('change', loadParts);
    
    searchBtn.addEventListener('click', loadParts);
    searchInput.addEventListener('keypress', e => {
        if (e.key === 'Enter') loadParts();
    });

    loadParts();
    generateFilters(select.value);
    loadSavedQuotes();
    
    /* PARTS BROWING AND ADDING */
    
    // Fetch parts for the selected category and searching term(s)
    async function loadParts() {
        const cat    = select.value;
        const search = searchInput.value.trim();
        const cfg    = displayMap[cat];
        
        // Render table headers
        tableHeader.innerHTML = '';
        cfg.headers.forEach(h => tableHeader.innerHTML += `<th>${h}</th>`);
        tableHeader.innerHTML += `<th>Action</th>`;

        let url = `?action=get_parts`
                + `&category=${encodeURIComponent(cat)}`
                + `&search=${encodeURIComponent(search)}`;

        filtersContainer.querySelectorAll('input').forEach(inp => {
            const key = inp.dataset.key;
            const dir = inp.dataset.dir;    
            const val = inp.value.trim();
            if (!val) return;               
            const suffix = dir === 'min' ? '_min' : '_max';
            url += `&filter_${key}${suffix}=${encodeURIComponent(val)}`;
        });

        // Fetch from backend
        const res = await fetch(url);
        const { parts } = await res.json();
        
        // Fill the table body with data
        tableBody.innerHTML = '';
        parts.forEach(row => {
            const tr = document.createElement('tr');
            cfg.keys.forEach(k => {
                const td = document.createElement('td');
                td.textContent = row[k] ?? '';
                tr.appendChild(td);
            });

            const actionTd = document.createElement('td');
            const btn = document.createElement('button');
            btn.textContent = 'Add';
            btn.className = 'btn btn-sm btn-success';
            btn.addEventListener('click', () => {
              addToCurrent(row.id, row.model, row.price, cat);
            });
            actionTd.appendChild(btn);
            tr.appendChild(actionTd);

            tableBody.appendChild(tr);
        });
    }


    function addToCurrent(id, model, price, category) {
		currentItems.push({ id, model, price, category });
		renderCurrent();
    }

    // Existed in prototype, but not in use anymore
    /*function removeFromCurrent(category) {
      currentItems = currentItems.filter(it => it.category !== category);
      renderCurrent();
    }*/

    function generateFilters(category) {
		filtersContainer.innerHTML = '';

		const keys = numericSpecsMap[category] || [];
		keys.forEach(key => {
			const wrapper = document.createElement('div');
			wrapper.className = 'col-sm-6 col-md-3 mb-2';

			const fg = document.createElement('div');
			fg.className = 'form-group mb-0';

			const label = document.createElement('label');
			label.textContent = filterDisplayLabelMap[key] || key;
			fg.appendChild(label);

			const flex = document.createElement('div');
			flex.className = 'd-flex';

			const min = document.createElement('input');
			min.type = 'number';
			min.placeholder = 'Min';
			min.className = 'form-control form-control-sm';
			min.dataset.key = key;
			min.dataset.dir = 'min';

			const max = document.createElement('input');
			max.type = 'number';
			max.placeholder = 'Max';
			max.className = 'form-control form-control-sm ms-2';
			max.dataset.key = key;
			max.dataset.dir = 'max';

			[min, max].forEach(inp => {
			inp.addEventListener('keydown', e => {
				if (e.key === 'Enter') {
				loadParts();
				}
			});
			});

			flex.appendChild(min);
			flex.appendChild(max);
			fg.appendChild(flex);
			wrapper.appendChild(fg);
			filtersContainer.appendChild(wrapper);
		});
    }

    //renders current quote
    function renderCurrent() {
      const tbody = document.getElementById('currentBody');
      tbody.innerHTML = '';
      let sum = 0;

      currentItems
        .map((it, idx) => ({ it, idx }))
        .sort((a, b) =>
          categoryOrder.indexOf(a.it.category) - categoryOrder.indexOf(b.it.category)
        )
        .forEach(({ it, idx }) => {
          const tr = document.createElement('tr');
          tr.innerHTML = `
            <td>${it.category}</td>  
            <td>${it.model}</td>
            <td>${it.price}</td>
            <td>
              <button class="btn btn-sm btn-danger">Remove</button>
            </td>
          	`;
          tr.querySelector('button').addEventListener('click', () => {
				currentItems.splice(idx, 1);
				renderCurrent();
          });
			sum += parseFloat(it.price);
			tbody.appendChild(tr);
        });

      document.getElementById('currentTotal').textContent = sum.toFixed(2);
    }

    /* SAVED QUOTES MANAGEMENT */
    // Load and fetch saved quotes
    async function loadSavedQuotes() {
      const res = await fetch('?action=get_quotes');
      const quotes = await res.json();
      const tb = document.getElementById('savedBody');
      tb.innerHTML = '';

      if (quotes.length === 0) {
			tb.innerHTML = `
			<tr>
				<td colspan="4" class="text-center text-muted">
				There's no saved quote.
				</td>
			</tr>
			`;
			return;
		}

		quotes.forEach(q => {
			const total = Number(q.total_price).toFixed(2);
			const tr = document.createElement('tr');
			tr.innerHTML = `
			<td>${q.title}</td>
			<td>${parseFloat(q.total_price)
					.toLocaleString('en-US', { style: 'currency', currency: 'USD' })}</td>
			<td>
				<button class="btn btn-sm btn-outline-primary"
						onclick="viewDetails(${q.id}, '${q.title}')">
				View</button>
				<button class="btn btn-sm btn-outline-danger ms-1"
						onclick="deleteQuote(${q.id})">
				Delete</button>
			</td>
			`;
			tb.appendChild(tr);
		});
    }

    //Save the current quote into local DB
    window.saveCurrent = async function() {
		const title = prompt('Enter the title of the quote:');
		if (!title) return;

		const items = currentItems;  

		const isPublic = document.getElementById('publicCheckbox').checked ? 1 : 0;
		const comp = await fetch('?action=check_compatibility', {
			method:'POST', headers:{'Content-Type':'application/json'},
			body:JSON.stringify({ items: currentItems })
		}).then(r=>r.json());
		if (!comp.success && isPublic) {
			return alert('Failed to share quote publicly: Compatibility Error\n' + comp.issues.join('\n'));
		}
		const payload = { title, items: currentItems, is_public: comp.success ? +isPublic : 0 };

		const url = window.location.pathname.replace(/\/$/, '') + '?action=save_quote';
		//console.log('▶ saving to', url, { title, items, is_public: isPublic });

		try {
			const res = await fetch(url, {
			method: 'POST',
			headers: { 'Content-Type': 'application/json' },
			body: JSON.stringify({ title, items, is_public: isPublic })
			});
			if (!res.ok) {
			throw new Error(`HTTP ${res.status}`);
			}
			const data = await res.json();
			//console.log('▶ save_quote response', data);

			if (data.success) {
			alert('Quote saved successfully.');
			currentItems = [];
			renderCurrent();
			loadSavedQuotes();
			
			document.getElementById('publicCheckbox').checked = false;
			} else {
			alert('Failed to save quote.');
			}
		} catch (err) {
			console.error('saveCurrent error:', err);
			alert('A network error occurred during saving.');
		}
    };  

    //Check compatibility of the current quote
    window.checkCompatibility = async function() {
		if (!currentItems.length) {
			alert('You cannot save without any part.');
			return;
		}
		const res = await fetch('?action=check_compatibility', {
			method: 'POST',
			headers: {'Content-Type':'application/json'},
			body: JSON.stringify({ items: currentItems })
		});
		const data = await res.json();
		if (data.success) {
			alert('All parts are compatible!');
		} else {
			alert('Compatibility error:\n' + data.issues.join('\n'));
		}
    };

    /* COMMUNITY TAB */
    // Load publicly open quotes
    function loadCommunity() {
		fetch('?action=get_public_quotes')
			.then(res => res.json())
			.then(data => {
			const tbody = document.querySelector('#communityTable tbody');
			tbody.innerHTML = '';
			data.quotes.forEach(q => {
				const tr = document.createElement('tr');
				tr.innerHTML = `
				<td>${q.title}</td>
				<td>${q.author}</td>
				<td>${parseFloat(q.total_price)
					.toLocaleString('en-US', { style: 'currency', currency: 'USD' })}</td>
				<td>
					<button
					class="btn btn-sm btn-outline-primary"
					onclick="viewDetails(${q.id}, '${q.title.replace(/'/g, "\\'")}')"
					>
					View
					</button>
				</td>
				`;
				tbody.appendChild(tr);
			});
			})
			.catch(err => {
			//console.error('loadCommunity error:', err);
			alert('Failed to load public quotes.');
			});
    }
    
    // Fetch the data only when community tab is open
    // else, it will lag A LOT if there are many publicly opened quotes
    document.querySelector('a[href="#community"]')
		.addEventListener('shown.bs.tab', loadCommunity);

    // View details for saved quotes
    window.viewDetails = async (id, title) => {
		const res = await fetch(`?action=get_quote_details&quote_id=${id}`);
		const data = await res.json(); 
		document.getElementById('detailsTitle').textContent = title;
		const bd = document.getElementById('detailsBody'); bd.innerHTML = ''; 
		data.forEach(r => { bd.innerHTML += `<tr><td>${r.category}</td>
												<td>${r.manufacturer}</td>
												<td>${r.model}</td>
												<td>${r.price}</td>
												<td>${r.qty}</td></tr>`; });
		new bootstrap.Modal(document.getElementById('detailsModal')).show();
    };

    // Delete saved quotes (automatically delete publicly opened ones SINCE FK DELETE CASCADE)
    window.deleteQuote = async function(qid) {
		if (!confirm('Do you really want to delete this quote?')) return;
		try {
			const res = await fetch(`?action=delete_quote&quote_id=${qid}`);
			const data = await res.json();
			if (data.success) {
			alert('Quote deleted successfully.');
			loadSavedQuotes();
			} else {
			alert('Failed to delete quote.');
			}
		} catch (err) {
			//console.error(err);
			alert('An error occured during deletion.');
		}
    };

});
