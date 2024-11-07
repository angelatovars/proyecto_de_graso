from backend.flask import Blueprint, request, jsonify
from backend.flask_jwt_extended import jwt_required, get_jwt_identity
from backend.controllers.ranking_controller import RankingController

ranking_bp = Blueprint('ranking', __name__)

@ranking_bp.route('/ranking', methods=['POST'])
@jwt_required()
def guardar_puntaje():
    user_id = get_jwt_identity()
    data = request.get_json()
    puntaje_total = data.get('puntaje', 0)

    if RankingController.guardar_puntaje(user_id, puntaje_total):
        return jsonify({"message": "Puntaje guardado exitosamente"}), 201
    else:
        return jsonify({"message": "Error al guardar el puntaje"}), 500

@ranking_bp.route('/ranking', methods=['GET'])
def obtener_ranking():
    ranking = RankingController.obtener_ranking()
    return jsonify(ranking), 200

