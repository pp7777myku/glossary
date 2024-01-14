const svg = document.querySelector('svg');

function createArrow(id, x1, y1, x2, y2) {
    // 创建带箭头的线段（四分之三长度）
    const arrowLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
    arrowLine.setAttribute('id', id + '-arrow');
    arrowLine.setAttribute('stroke', 'black');
    arrowLine.setAttribute('stroke-width', '2');
    arrowLine.setAttribute('marker-end', 'url(#arrowhead)');

    // 创建剩余的直线（四分之一长度）
    const straightLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
    straightLine.setAttribute('id', id + '-straight');
    straightLine.setAttribute('stroke', 'black');
    straightLine.setAttribute('stroke-width', '2');

    // 计算四分之三点的坐标
    const x3 = x1 + 0.75 * (x2 - x1);
    const y3 = y1 + 0.75 * (y2 - y1);

    // 设置带箭头的线段坐标
    arrowLine.setAttribute('x1', x1);
    arrowLine.setAttribute('y1', y1);
    arrowLine.setAttribute('x2', x3);
    arrowLine.setAttribute('y2', y3);

    // 设置剩余直线的坐标
    straightLine.setAttribute('x1', x3);
    straightLine.setAttribute('y1', y3);
    straightLine.setAttribute('x2', x2);
    straightLine.setAttribute('y2', y2);

    // 将线段添加到SVG中
    svg.appendChild(arrowLine);
    svg.appendChild(straightLine);
}



function createLabel(edge, x, y, text) {
    const label = document.createElement('div');
    label.className = 'label';
    label.id = 'label-' + edge.id; // 给每个标签一个独特的 ID
    label.style.left = x + 'px';
    label.style.top = y + 'px';
    label.innerText = text;
    document.body.appendChild(label);
}

function createMarker() {
    const defs = document.createElementNS('http://www.w3.org/2000/svg', 'defs');
    const marker = document.createElementNS('http://www.w3.org/2000/svg', 'marker');
    const path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
    marker.setAttribute('id', 'arrowhead');
    marker.setAttribute('markerWidth', '10');
    marker.setAttribute('markerHeight', '10');
    marker.setAttribute('refX', '10');
    marker.setAttribute('refY', '5');
    marker.setAttribute('orient', 'auto');
    path.setAttribute('d', 'M 0 0 L 10 5 L 0 10 Z');
    path.setAttribute('fill', 'black');
    marker.appendChild(path);
    defs.appendChild(marker);
    svg.appendChild(defs);
}


let edges = [];

window.onload = async function() {
    createMarker();

    try {
        const response = await axios.get('/api/glossary');
        const data = response.data;
        const nodes = data.filter(item => !item.id.startsWith('e'));
        edges = data.filter(item => item.id.startsWith('e'));

        nodes.forEach(nodeData => {
            const node = document.createElement('div');
            node.className = 'node';
            node.id = 'node-' + nodeData.id;
            node.style.left = nodeData.position.x + 'px';
            node.style.top = nodeData.position.y + 'px';
           
            const label = document.createTextNode(nodeData.data.label);
            node.appendChild(label);
            node.innerText = nodeData.data.label;
            
            const tooltip = document.createElement('span');
            tooltip.className = 'tooltip';
            tooltip.textContent = nodeData.data.note;
            node.appendChild(tooltip);
           
            document.body.appendChild(node);
            makeDraggable(node);
        });

        edges.forEach(edge => {
            const sourceNode = document.getElementById('node-' + edge.source);
            const targetNode = document.getElementById('node-' + edge.target);
            const x1 = sourceNode.offsetLeft + sourceNode.offsetWidth / 2;
            const y1 = sourceNode.offsetTop + sourceNode.offsetHeight / 2;
            const x2 = targetNode.offsetLeft + targetNode.offsetWidth / 2;
            const y2 = targetNode.offsetTop + targetNode.offsetHeight / 2;
            const midX = (x1 + x2) / 2;
            const midY = (y1 + y2) / 2;
            createArrow('arrow-' + edge.id, x1, y1, x2, y2);
            createLabel(edge, midX, midY, edge.label);
        }

        )
    } catch (error) {
        console.error(error);
    }
};

function makeDraggable(node) {
    node.onmousedown = function(event) {
        event.preventDefault();
        let shiftX = event.clientX - node.getBoundingClientRect().left;
        let shiftY = event.clientY - node.getBoundingClientRect().top;

        node.style.cursor = 'grabbing';

        function moveAt(pageX, pageY) {
            // 计算元素的新位置
            let newX = pageX - shiftX;
            let newY = pageY - shiftY;

            // 获取SVG元素的尺寸
            const svg = document.querySelector('svg');
            const svgWidth = svg.clientWidth;
            const svgHeight = svg.clientHeight;

            // 获取节点元素的尺寸
            const nodeWidth = node.offsetWidth;
            const nodeHeight = node.offsetHeight;

            // 确保新位置不超出SVG边界
            if (newX < 0) {
                newX = 0;
            }
            if (newX + nodeWidth > svgWidth) {
                newX = svgWidth - nodeWidth;
            }
            if (newY < 0) {
                newY = 0;
            }
            if (newY + nodeHeight > svgHeight) {
                newY = svgHeight - nodeHeight;
            }

            // 设置节点的新位置
            node.style.left = newX + 'px';
            node.style.top = newY + 'px';

            updateArrows(node);
        }

        function onMouseMove(event) {
            moveAt(event.pageX, event.pageY);
        }

        document.addEventListener('mousemove', onMouseMove);

        function onMouseUp() {
            document.removeEventListener('mousemove', onMouseMove);
            node.onmouseup = null;
            node.style.cursor = 'grab';
        }

        document.addEventListener('mouseup', onMouseUp, { once: true });
    };

    node.ondragstart = function() {
        return false;
    };
}



function updateArrows(node) {
    const nodeId = node.id.replace('node-', '');
    edges.forEach(edge => {
        if (edge.source === nodeId || edge.target === nodeId) {
            const sourceNode = document.getElementById('node-' + edge.source);
            const targetNode = document.getElementById('node-' + edge.target);
            const arrowLine = document.getElementById('arrow-' + edge.id + '-arrow');
            const straightLine = document.getElementById('arrow-' + edge.id + '-straight');
            const label = document.getElementById('label-' + edge.id);

            if (arrowLine && straightLine && label) {
                const x1 = sourceNode.offsetLeft + sourceNode.offsetWidth / 2;
                const y1 = sourceNode.offsetTop + sourceNode.offsetHeight / 2;
                const x2 = targetNode.offsetLeft + targetNode.offsetWidth / 2;
                const y2 = targetNode.offsetTop + targetNode.offsetHeight / 2;

                // 计算四分之三点的坐标
                const x3 = x1 + 0.75 * (x2 - x1);
                const y3 = y1 + 0.75 * (y2 - y1);

                // 更新带箭头的线段坐标
                arrowLine.setAttribute('x1', x1);
                arrowLine.setAttribute('y1', y1);
                arrowLine.setAttribute('x2', x3);
                arrowLine.setAttribute('y2', y3);

                // 更新剩余直线的坐标
                straightLine.setAttribute('x1', x3);
                straightLine.setAttribute('y1', y3);
                straightLine.setAttribute('x2', x2);
                straightLine.setAttribute('y2', y2);

                // 更新标签位置（放在整个线段的中间）
                const labelX = x1 + 0.5 * (x2 - x1);
                const labelY = y1 + 0.5 * (y2 - y1);
                label.style.left = labelX + 'px';
                label.style.top = labelY + 'px';
            }
        }
    });
}


window.addEventListener('resize', function() {
    // 获取新的SVG尺寸
    const svg = document.querySelector('svg');
    const svgWidth = svg.clientWidth;
    const svgHeight = svg.clientHeight;

    // 获取所有节点元素
    const nodes = document.querySelectorAll('.node');

    // 遍历节点元素，确保它们不超出新的SVG边界
    nodes.forEach(node => {
        const nodeWidth = node.offsetWidth;
        const nodeHeight = node.offsetHeight;
        const currentLeft = parseInt(node.style.left);
        const currentTop = parseInt(node.style.top);

        // 检查并调整左边界
        if (currentLeft + nodeWidth > svgWidth) {
            node.style.left = (svgWidth - nodeWidth) + 'px';
        }

        // 检查并调整上边界
        if (currentTop + nodeHeight > svgHeight) {
            node.style.top = (svgHeight - nodeHeight) + 'px';
        }
    });

    // 更新所有箭头和标签的位置
    updateArrowsForAllNodes();
});

function updateArrowsForAllNodes() {
    const nodes = document.querySelectorAll('.node');
    nodes.forEach(node => {
        updateArrows(node);
    });
}



