import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["submitWarning"]

    validate(event) {
        let valid = true

        const requiredFields = this.element.querySelectorAll("[data-required='true']")

        requiredFields.forEach(field => {
            if (!field.value.trim()) {
                this.showError(field, "Campo obrigatório")
                valid = false
            } else {
                this.hideError(field)
            }
        })

        // valida contrato CLT
        const contractClt = this.element.querySelector("input[value='clt']:checked")
        const contractFreelancer = this.element.querySelector("input[value='freelancer']:checked")

        if (contractClt) {
            const salary = this.element.querySelector("[data-field='salary']")
            if (salary && !salary.value.trim()) {
                this.showError(salary, "Salário é obrigatório para CLT")
                valid = false
            } else if (salary) {
                this.hideError(salary)
            }
        }

        if (contractFreelancer) {
            const hourlyRate = this.element.querySelector("[data-field='hourly_rate']")
            if (hourlyRate && !hourlyRate.value.trim()) {
                this.showError(hourlyRate, "Valor por hora é obrigatório para Freelancer")
                valid = false
            } else if (hourlyRate) {
                this.hideError(hourlyRate)
            }
        }

        if (!valid) {
            event.preventDefault()
            this.showSubmitWarning()
        } else {
            this.hideSubmitWarning()
        }
    }

    showSubmitWarning() {
        if (this.hasSubmitWarningTarget) {
            this.submitWarningTarget.classList.remove("hidden")
        }
    }

    hideSubmitWarning() {
        if (this.hasSubmitWarningTarget) {
            this.submitWarningTarget.classList.add("hidden")
        }
    }

    showError(field, message) {
        this.hideError(field)

        field.classList.add("border-red-500")
        field.classList.remove("border-gray-600")

        const error = document.createElement("p")
        error.classList.add("text-red-400", "text-xs", "mt-1", "field-error")
        error.textContent = message

        field.parentNode.appendChild(error)
    }

    hideError(field) {
        field.classList.remove("border-red-500")
        field.classList.add("border-gray-600")

        const existing = field.parentNode.querySelector(".field-error")
        if (existing) existing.remove()
    }
}